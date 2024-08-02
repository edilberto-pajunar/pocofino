final class LoginException implements Exception {
  const LoginException(this.e);
  final Exception e;
}

final class LogoutException implements Exception {
  const LogoutException(this.e);
  final Exception e;
}

final class SignUpException implements Exception {
  const SignUpException(this.e);
  final Exception e;
}
