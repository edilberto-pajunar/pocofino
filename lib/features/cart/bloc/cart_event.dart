part of 'cart_bloc.dart';

final class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartInitRequested extends CartEvent {}

final class CartInitProductsRequested extends CartEvent {
  const CartInitProductsRequested();
}

final class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded(this.product);
}

final class CartProductEdited extends CartEvent {
  final Product product;

  const CartProductEdited(this.product);
}

final class CartProductRemoved extends CartEvent {
  final Product product;

  const CartProductRemoved(this.product);
}
