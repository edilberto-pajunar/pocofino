import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<ProductInitRequested>(_onInitRequested);
    on<ProductInitQuantityRequested>(_onInitQuantityRequested);
    on<ProductQuantityIncremented>(_onQuantityIncremented);
    on<ProductQuantityDecremented>(_onQuantityDecremented);
  }

  void _onInitRequested(
    ProductInitRequested event,
    Emitter<ProductState> emit,
  ) {
    add(ProductInitQuantityRequested(event.quantity ?? 0));
  }

  void _onInitQuantityRequested(
    ProductInitQuantityRequested event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(quantity: event.quantity));
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
