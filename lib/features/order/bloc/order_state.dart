part of 'order_bloc.dart';

enum OrderStatus { idle, loading, success, failed, cancelled }

enum OrderPlaceStatus { idle, loading, success, failed }

final class OrderState extends Equatable {
  final OrderStatus status;
  final OrderPlaceStatus orderPlaceStatus;
  final List<Order> orders;
  final List<Store> stores;
  final String? paymentUrl;
  final String? error;
  final Store? store;
  final String? mobileNumber;
  final String? firstName;
  final String? lastName;

  const OrderState({
    this.status = OrderStatus.idle,
    this.orderPlaceStatus = OrderPlaceStatus.idle,
    this.orders = const [],
    this.stores = const [],
    this.paymentUrl = "",
    this.error = "",
    this.store,
    this.mobileNumber,
    this.firstName,
    this.lastName,
  });

  OrderState copyWith({
    OrderStatus? status,
    OrderPlaceStatus? orderPlaceStatus,
    List<Order>? orders,
    List<Store>? stores,
    String? paymentUrl,
    String? error,
    Store? store,
    String? mobileNumber,
    String? firstName,
    String? lastName,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderPlaceStatus: orderPlaceStatus ?? this.orderPlaceStatus,
      orders: orders ?? this.orders,
      stores: stores ?? this.stores,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      error: error ?? this.error,
      store: store ?? this.store,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [
        status,
        orderPlaceStatus,
        orders,
        stores,
        paymentUrl,
        error,
        store,
        mobileNumber,
        firstName,
        lastName,
      ];
}
