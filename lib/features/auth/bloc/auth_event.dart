part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLoginRequested extends AuthEvent {}

final class AuthCreateAccountRequested extends AuthEvent {
  final String username;
  final String name;
  final String email;
  final String password;

  const AuthCreateAccountRequested({
    required this.username,
    required this.name,
    required this.email,
    required this.password,
  });
}

final class AuthGoogleSignInAttempted extends AuthEvent {
  final String? userId;

  const AuthGoogleSignInAttempted({this.userId});
}

final class AuthSignInFailed extends AuthEvent {
  final String signInException;
  const AuthSignInFailed(this.signInException);
}
