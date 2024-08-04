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
    await emit.forEach(_productRepository.productStream(),
        onData: (products) => MenuState(products: products));
  }
}
