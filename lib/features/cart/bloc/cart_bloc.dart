import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartProductAdded>(_onProductAdded);
  }

  void _onProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) {
  
    emit(state.copyWith(
      products: [...state.products, event.product],
    ));
  }
}
