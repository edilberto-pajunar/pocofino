part of 'app_bloc.dart';

enum AppStatus { initial, loggingIn, unathenticated, authenticated, failed }

class AppState extends Equatable {
  final AppStatus status;
  final String? token;
  final String? error;

  const AppState({
    this.status = AppStatus.initial,
    this.token = "",
    this.error,
  });

  AppState copyWith({
    AppStatus? status,
    String? token,
    String? error,
  }) {
    return AppState(
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        token,
        error,
      ];
}
