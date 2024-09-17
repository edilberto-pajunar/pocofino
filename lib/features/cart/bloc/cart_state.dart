part of 'cart_bloc.dart';

enum CartStatus { idle, loading, success, failure }

final class CartState extends Equatable {
  final List<Product> products;
  final CartStatus status;

  const CartState({
    this.products = const [],
    this.status = CartStatus.idle,
  });

  CartState copyWith({
    List<Product>? products,
    CartStatus? status,
  }) {
    return CartState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        products,
        status,
      ];
}
