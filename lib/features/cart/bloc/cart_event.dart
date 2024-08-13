part of 'cart_bloc.dart';

final class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded(this.product);
}
