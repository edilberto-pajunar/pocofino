part of 'auth_bloc.dart';

enum LoginStatus {
  idle,
  loggingIn,
  cancelled,
  loginSuccess,
  loginFailure,
}

final class AuthState extends Equatable {
  final LoginStatus status;
  final String? error;

  const AuthState({
    this.status = LoginStatus.idle,
    this.error,
  });

  AuthState copyWith({
    LoginStatus? status,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
