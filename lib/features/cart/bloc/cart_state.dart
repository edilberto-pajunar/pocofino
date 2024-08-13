part of 'cart_bloc.dart';

final class CartState extends Equatable {
  final List<Product> products;

  const CartState({
    this.products = const [],
  });

  CartState copyWith({
    List<Product>? products,
  }) {
    return CartState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [
        products,
      ];
}
