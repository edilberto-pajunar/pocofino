part of 'order_bloc.dart';

enum OrderStatus { idle, loading, success, failed }

final class OrderState extends Equatable {
  final OrderStatus status;
  final String? error;

  const OrderState({
    this.status = OrderStatus.idle,
    this.error = "",
  });

  OrderState copyWith({
    OrderStatus? status,
    String? error,
  }) {
    return OrderState(
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
