import 'dart:convert';
import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/user_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FlutterSecureStorage _flutterSecureStorage;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required ApiRepository apiRepository,
    required FlutterSecureStorage flutterSecureStorage,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _flutterSecureStorage = flutterSecureStorage;
  AppUser? _toAppUser(User? firebaseUser) {
    if (firebaseUser == null) return null;

    return AppUser(
      id: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
      phoneNumber: firebaseUser.phoneNumber,
    );
  }

  AppUser? get currentUser => _toAppUser(_firebaseAuth.currentUser);

  Stream<AppUser?> get currentUserStream =>
      _firebaseAuth.authStateChanges().map(_toAppUser);

  Future<UserCredential?> signInWithGoogle(
    String? userId,
  ) async {
    try {
      final googleSignInAcc = await _googleSignIn.signIn();

      // Cancelled sign-in
      if (googleSignInAcc == null) {
        return null;
      }

      final googleSignInAuth = await googleSignInAcc.authentication;
      final googleAuthCreds = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );

      if (userId != null) {
        await linkEmail(
          userId: userId,
          authCredential: googleAuthCreds,
        );
      }

      final signedInUserCreds =
          await _firebaseAuth.signInWithCredential(googleAuthCreds);
      return signedInUserCreds;
    } catch (e) {
      throw LoginException(e as Exception);
    }
  }

  Future<void> linkEmail({
    required String userId,
    required AuthCredential authCredential,
  }) async {
    final user =
        await _firebaseAuth.currentUser?.linkWithCredential(authCredential);
    await DatabaseApi.instance.setData(
      path: "users/$userId",
      data: {
        "user": {
          "email": user!.user?.email,
        }
      },
      merge: true,
    );
  }

  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCreds = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCreds;
    } catch (e) {
      throw LoginException(e as Exception);
    }
  }

  // <--------------- ALL HTTP REQUESTS ---------------->
  Future<void> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/register");
      final body = {
        "username": username,
        "email": email,
        "password": password,
      };

      final response = await http.post(
        uri,
        body: body,
      );

      if (response.statusCode == 200) {
        log("Account created successfully!");
      } else {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/login");
      final body = {
        "email": email,
        "password": password,
      };

      final response = await http.post(
        uri,
        body: body,
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        log("Account created successfully!");
        return body["token"];
      } else {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeToken(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> readToken(String key) async {
    String? value = await _flutterSecureStorage.read(key: key);
    print("Data read from secure storage: $value");

    return value;
  }

  Future<void> deleteToken(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  Future<void> checkToken({
    required String token,
  }) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/users/token-check");

      final response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        log(body["message"]);
      } else {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
