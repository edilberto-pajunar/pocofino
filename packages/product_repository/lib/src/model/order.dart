import 'package:json_annotation/json_annotation.dart';
import 'package:product_repository/product_repository.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "order_number")
  final String? orderNumber;
  @JsonKey(name: "total_amount")
  final String? totalAmount;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "products")
  final List<Product>? products;

  Order({
    this.id,
    this.orderNumber,
    this.totalAmount,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.products = const [],
  });

  Order copyWith({
    int? id,
    String? orderNumber,
    String? totalAmount,
    String? status,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Product>? products,
  }) =>
      Order(
        id: id ?? this.id,
        orderNumber: orderNumber ?? this.orderNumber,
        totalAmount: totalAmount ?? this.totalAmount,
        status: status ?? this.status,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        products: products ?? this.products,
      );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
