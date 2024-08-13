import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<ProductQuantityIncremented>(_onQuantityIncremented);
    on<ProductQuantityDecremented>(_onQuantityDecremented);
  }

  void _onQuantityIncremented(
    ProductQuantityIncremented event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(
      quantity: state.quantity + 1,
    ));
  }

  void _onQuantityDecremented(
    ProductQuantityDecremented event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(
      quantity: state.quantity - 1,
    ));
  }
}
