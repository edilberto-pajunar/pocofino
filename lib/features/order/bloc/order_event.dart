part of 'order_bloc.dart';

final class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class OrderInitRequested extends OrderEvent {}

final class OrderInitStoresRequested extends OrderEvent {}

final class OrderPlaceRequested extends OrderEvent {
  final List<Product> products;
  final double total;

  const OrderPlaceRequested(this.products, this.total);
}

final class OrderFailed extends OrderEvent {
  final String error;

  const OrderFailed(this.error);
}
