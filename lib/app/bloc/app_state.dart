part of 'app_bloc.dart';

enum AppStatus { initial, loggingIn, unathenticated, authenticated, failed }

class AppState extends Equatable {
  final AppStatus status;
  final String? token;
  final int tabIndex;
  final String? error;
  final AppUser? currentUser;

  const AppState({
    this.status = AppStatus.initial,
    this.token = "",
    this.tabIndex = 0,
    this.error,
    this.currentUser,
  });

  AppState copyWith({
    AppStatus? status,
    String? token,
    int? tabIndex,
    String? error,
    AppUser? currentUser,
  }) {
    return AppState(
      status: status ?? this.status,
      token: token ?? this.token,
      tabIndex: tabIndex ?? this.tabIndex,
      error: error ?? this.error,
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  List<Object?> get props => [
        status,
        token,
        tabIndex,
        error,
        currentUser,
      ];
}
