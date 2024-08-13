part of 'product_bloc.dart';

final class ProductState extends Equatable {
  final int quantity;

  const ProductState({
    this.quantity = 0,
  });

  ProductState copyWith({
    int? quantity,
  }) {
    return ProductState(
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [
        quantity,
      ];
}
