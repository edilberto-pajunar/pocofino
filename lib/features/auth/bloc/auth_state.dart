part of 'auth_bloc.dart';

enum AuthStatus {
  idle,
  loading,
  cancelled,
  success,
  failure,
}

final class AuthState extends Equatable {
  final AuthStatus status;
  final String? error;

  const AuthState({
    this.status = AuthStatus.idle,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
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
