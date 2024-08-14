import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ProductRepository _productRepository;
  final String _token;

  OrderBloc({
    required ProductRepository productRepository,
    required String token,
  })  : _productRepository = productRepository,
        _token = token,
        super(const OrderState()) {
    on<OrderInitRequested>(_onInitRequested);
    on<OrderInitOrdersRequested>(_onInitOrderRequested);
    on<OrderPlaceRequested>(_onPlaceRequested);
    on<OrderFailed>(_onOrderFailed);
  }

  void _onInitRequested(
    OrderInitRequested event,
    Emitter<OrderState> emit,
  ) {
    add(OrderInitOrdersRequested());
  }

  void _onInitOrderRequested(
    OrderInitOrdersRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final orders = await _productRepository.getOrders(_token);
      emit(state.copyWith(status: OrderStatus.success, orders: orders));
    } catch (e) {
      add(OrderFailed(e.toString()));
    }
  }

  void _onPlaceRequested(
    OrderPlaceRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      await _productRepository.placeOrder(event.products, _token);
      emit(state.copyWith(status: OrderStatus.success));
    } catch (e) {
      add(OrderFailed(e.toString()));
    }
  }

  void _onOrderFailed(
    OrderFailed event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(
      error: event.error,
      status: OrderStatus.failed,
    ));
  }
}
