import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/user_repository.dart';
import 'package:database_api/database_api.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

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
}
