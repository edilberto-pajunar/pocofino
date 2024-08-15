part of 'order_bloc.dart';

enum OrderStatus { idle, loading, success, failed }

enum OrderPlaceStatus { idle, loading, success, failed }

final class OrderState extends Equatable {
  final OrderStatus status;
  final OrderPlaceStatus orderPlaceStatus;
  final List<Order> orders;
  final List<Store> stores;
  final String? error;

  const OrderState({
    this.status = OrderStatus.idle,
    this.orderPlaceStatus = OrderPlaceStatus.idle,
    this.orders = const [],
    this.stores = const [],
    this.error = "",
  });

  OrderState copyWith({
    OrderStatus? status,
    OrderPlaceStatus? orderPlaceStatus,
    List<Order>? orders,
    List<Store>? stores,
    String? error,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderPlaceStatus: orderPlaceStatus ?? this.orderPlaceStatus,
      orders: orders ?? this.orders,
      stores: stores ?? this.stores,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        orderPlaceStatus,
        orders,
        stores,
        error,
      ];
}
