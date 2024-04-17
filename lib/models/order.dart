import 'package:equatable/equatable.dart';

class Order extends Equatable {
  const Order({
    required this.id,
    required this.productId,
    required this.quantity,
  });

  final String id;
  final String productId;
  final int quantity;

  @override
  List<Object> get props => [
        id,
        productId,
        quantity,
      ];
}
