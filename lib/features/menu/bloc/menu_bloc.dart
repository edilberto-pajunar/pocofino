import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ProductRepository _productRepository;
  final String _token;

  MenuBloc({
    required ProductRepository productRepository,
    required String token,
  })  : _productRepository = productRepository,
        _token = token,
        super(const MenuState()) {
    on<MenuInitRequested>(_onInitRequested);
    on<MenuInitProductsRequested>(_onInitProductsRequested);
    on<MenuProductsCategoryRequested>(_onProductsCategoryRequested);
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
      final products = await _productRepository.getProducts(_token);
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

  void _onProductsCategoryRequested(
    MenuProductsCategoryRequested event,
    Emitter<MenuState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MenuStatus.loading));
      final products = await _productRepository.getCategoryProducts(
        event.category,
        _token,
      );
      emit(state.copyWith(
        status: MenuStatus.success,
        products: products,
      ));
    } catch (e) {
      add(MenuFailed(e.toString()));
    }
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
