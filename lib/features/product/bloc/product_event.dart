part of 'product_bloc.dart';

final class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductInitRequested extends ProductEvent {
  final int? quantity;

  const ProductInitRequested({
    this.quantity,
  });
}

final class ProductInitQuantityRequested extends ProductEvent {
  final int quantity;

  const ProductInitQuantityRequested(this.quantity);
}

final class ProductQuantityIncremented extends ProductEvent {}

final class ProductQuantityDecremented extends ProductEvent {}
