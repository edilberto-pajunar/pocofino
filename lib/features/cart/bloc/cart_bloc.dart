import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductRepository _productRepository;

  CartBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const CartState()) {
    on<CartInitRequested>(_onInitRequested);
    on<CartInitProductsRequested>(_onInitProductsRequested);
    on<CartProductAdded>(_onProductAdded);
    on<CartProductEdited>(_onProductEdited);
    on<CartProductRemoved>(_onProductRemoved);
  }

  void _onInitRequested(
    CartInitRequested event,
    Emitter<CartState> emit,
  ) async {
    add(const CartInitProductsRequested());
  }

  void _onInitProductsRequested(
    CartInitProductsRequested event,
    Emitter<CartState> emit,
  ) async {
    final cartProducts = await _productRepository.getCartsProduct();
    emit(state.copyWith(products: cartProducts));
  }

  void _onProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));
      await _productRepository.addToCart(event.product);
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure));
    }
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
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));
      await _productRepository.removeFromCart(event.product.id);
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure));
      rethrow;
    }
  }
}
