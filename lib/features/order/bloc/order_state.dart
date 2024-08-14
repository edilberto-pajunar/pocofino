part of 'order_bloc.dart';

enum OrderStatus { idle, loading, success, failed }

final class OrderState extends Equatable {
  final OrderStatus status;
  final List<Order> orders;
  final String? error;

  const OrderState({
    this.status = OrderStatus.idle,
    this.orders = const [],
    this.error = "",
  });

  OrderState copyWith({
    OrderStatus? status,
    List<Order>? orders,
    String? error,
  }) {
    return OrderState(
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
