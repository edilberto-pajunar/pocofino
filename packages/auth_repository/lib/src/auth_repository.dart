import 'package:api_repository/api_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:database_api/database_api.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FlutterSecureStorage _flutterSecureStorage;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
    required ApiRepository apiRepository,
    required FlutterSecureStorage flutterSecureStorage,
  })  : _firebaseAuth = firebaseAuth,
        _flutterSecureStorage = flutterSecureStorage;

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
  Future<String> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final req = RequestModel(
        endpoint: "/api/register",
        type: RequestType.post,
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );

      final response = await ApiRepository().send(req);
      return response["message"];
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final request = RequestModel(
        endpoint: "/api/login",
        type: RequestType.post,
        data: {
          "email": email,
          "password": password,
        },
      );

      final response = await ApiRepository().send(request);
      return response["token"];
    } catch (e) {
      print(e);
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

  Future<AppUser> getInfo({
    required String token,
  }) async {
    try {
      final req = RequestModel(
        endpoint: "/api/users/info",
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);
      final user = AppUser.fromJson(response["data"]);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final req = RequestModel(
        endpoint: "/api/logout",
        type: RequestType.post,
        data: {},
      );

      final response = await ApiRepository().send(req);
      return response["message"];
    } catch (e) {
      rethrow;
    }
  }
}
