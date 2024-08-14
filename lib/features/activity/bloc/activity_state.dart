part of 'activity_bloc.dart';

enum ActivityStatus { initial, loading, success, failed }

final class ActivityState extends Equatable {
  final ActivityStatus status;
  final List<Order> orders;
  final String? error;

  const ActivityState({
    this.status = ActivityStatus.initial,
    this.orders = const [],
    this.error = "",
  });

  ActivityState copyWith({
    ActivityStatus? status,
    List<Order>? orders,
    String? error,
  }) {
    return ActivityState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        orders,
        error,
      ];
}
