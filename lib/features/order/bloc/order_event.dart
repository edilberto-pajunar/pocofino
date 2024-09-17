part of 'order_bloc.dart';

final class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class OrderInitRequested extends OrderEvent {}

final class OrderInitStoresRequested extends OrderEvent {}


final class OrderContactInformationSubmitted extends OrderEvent {
  final String mobileNumber;
  final String firstName;
  final String lastName;

  const OrderContactInformationSubmitted({
    required this.mobileNumber,
    required this.firstName,
    required this.lastName,
  });
}

final class OrderStoreSubmitted extends OrderEvent {
  final Store store;

  const OrderStoreSubmitted(this.store);
}

final class OrderPlaceStatusUpdated extends OrderEvent {
  final OrderPlaceStatus status;

  const OrderPlaceStatusUpdated(this.status);
}

final class OrderFailed extends OrderEvent {
  final String error;

  const OrderFailed(this.error);
}
