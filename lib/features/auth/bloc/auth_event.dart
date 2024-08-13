part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthCreateAccountRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;

  const AuthCreateAccountRequested({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInRequested({
    required this.email,
    required this.password,
  });
}

final class AuthGoogleSignInAttempted extends AuthEvent {
  final String? userId;

  const AuthGoogleSignInAttempted({this.userId});
}

final class AuthAdminSignInAttempted extends AuthEvent {
  final String email;
  final String password;

  const AuthAdminSignInAttempted(this.email, this.password);
}

final class AuthStoreTokenRequested extends AuthEvent {
  final String token;

  const AuthStoreTokenRequested(this.token);
}

final class AuthSignInFailed extends AuthEvent {
  final String signInException;
  const AuthSignInFailed(this.signInException);
}

