import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartProductAdded>(_onProductAdded);
    on<CartProductEdited>(_onProductEdited);
    on<CartProductRemoved>(_onProductRemoved);
  }

  void _onProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(
      products: [...state.products, event.product],
    ));
  }

  void _onProductEdited(
    CartProductEdited event,
    Emitter<CartState> emit,
  ) {
    final updatedProducts = state.products.map((product) {
      return product.id == event.product.id ? event.product : product;
    }).toList();

    emit(state.copyWith(
      products: updatedProducts,
    ));
  }

  void _onProductRemoved(
    CartProductRemoved event,
    Emitter<CartState> emit,
  ) {
    final updatedProducts = List<Product>.from(state.products);

    updatedProducts.remove(event.product);

    emit(state.copyWith(
      products: updatedProducts,
    ));
  }
}
