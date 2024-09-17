import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location_repository/location_repository.dart';
import 'package:product_repository/product_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ProductRepository _productRepository;
  final LocationRepository _locationRepository;
  final String _token;

  OrderBloc({
    required ProductRepository productRepository,
    required LocationRepository locationRepository,
    required String token,
  })  : _productRepository = productRepository,
        _locationRepository = locationRepository,
        _token = token,
        super(const OrderState()) {
    on<OrderInitRequested>(_onInitRequested);
    on<OrderInitStoresRequested>(_onInitStoresRequested);
    on<OrderStoreSubmitted>(_onStoreSubmitted);
    on<OrderContactInformationSubmitted>(_onContactInformationSubmitted);
    on<OrderPlaceStatusUpdated>(_onStatusUpdated);
    on<OrderFailed>(_onOrderFailed);
  }

  void _onInitRequested(
    OrderInitRequested event,
    Emitter<OrderState> emit,
  ) {
    add(OrderInitStoresRequested());
  }

  void _onInitStoresRequested(
    OrderInitStoresRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final stores = await _locationRepository.getAllStores(_token);
      emit(state.copyWith(status: OrderStatus.success, stores: stores));
    } catch (e) {
      add(OrderFailed(e.toString()));
    }
  }


  void _onContactInformationSubmitted(
    OrderContactInformationSubmitted event,
    Emitter<OrderState> emit,
  ) {
    emit(state.copyWith(
      mobileNumber: event.mobileNumber,
      firstName: event.firstName,
      lastName: event.lastName,
    ));
  }

  void _onStoreSubmitted(
    OrderStoreSubmitted event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(
      store: event.store,
    ));
  }

  void _onStatusUpdated(
    OrderPlaceStatusUpdated event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(
      orderPlaceStatus: event.status,
    ));
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
