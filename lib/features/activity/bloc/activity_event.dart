part of 'activity_bloc.dart';

final class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

final class ActivityInitRequested extends ActivityEvent {}

final class ActivityOrdersRequested extends ActivityEvent {
  final String status;

  const ActivityOrdersRequested(this.status);
}

final class ActivityFailed extends ActivityEvent {
  final String error;

  const ActivityFailed(this.error);
}
