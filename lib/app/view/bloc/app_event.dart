part of 'app_bloc.dart';

final class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppInitRequested extends AppEvent {}

final class AppInitAuthRequested extends AppEvent {}

final class AppFailed extends AppEvent {
  final String error;

  const AppFailed(this.error);
}
