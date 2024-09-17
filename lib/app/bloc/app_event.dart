part of 'app_bloc.dart';

final class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppInitRequested extends AppEvent {}

final class AppInitAuthRequested extends AppEvent {}

final class AppHomeIndexChanged extends AppEvent {
  final int index;

  const AppHomeIndexChanged(this.index);
}

final class AppFailed extends AppEvent {
  final String error;

  const AppFailed(this.error);
}

final class AppLogoutRequested extends AppEvent {}
