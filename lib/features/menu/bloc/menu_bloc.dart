import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ProductRepository _productRepository;

  MenuBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const MenuState()) {
    on<MenuInitRequested>(_onInitRequested);
    on<MenuInitProductsRequested>(_onInitProductsRequested);
    on<MenuFailed>(_onMenuFailed);
  }

  void _onInitRequested(
    MenuInitRequested event,
    Emitter<MenuState> emit,
  ) async {
    add(MenuInitProductsRequested());
  }

  void _onInitProductsRequested(
    MenuInitProductsRequested event,
    Emitter<MenuState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MenuStatus.loading));
      final products = await _productRepository.getProducts();
      emit(state.copyWith(
        status: MenuStatus.success,
        products: products,
      ));
    } catch (e) {
      add(MenuFailed(e.toString()));
    }
    // await emit.forEach(_productRepository.productStream(),
    //     onData: (products) => MenuState(products: products));
  }

  void _onMenuFailed(
    MenuFailed event,
    Emitter<MenuState> emit,
  ) async {
    emit(state.copyWith(
      status: MenuStatus.failure,
      error: event.error,
    ));
  }
}
