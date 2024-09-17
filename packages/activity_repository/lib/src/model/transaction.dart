import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

enum PaymentType { topUp, payment }

@JsonSerializable()
class Transaction {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "wallet_id")
  final int walletId;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "payment_type", fromJson: _paymentTypeFromJson, toJson: _paymentTypeToJson)
  final PaymentType paymentType;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.walletId,
    required this.type,
    required this.description,
    required this.amount,
    required this.paymentType,
    required this.createdAt,
    required this.updatedAt,
  });

  Transaction copyWith({
    int? id,
    int? userId,
    int? walletId,
    String? type,
    String? description,
    int? amount,
    PaymentType? paymentType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Transaction(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        walletId: walletId ?? this.walletId,
        type: type ?? this.type,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        paymentType: paymentType ?? this.paymentType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  static PaymentType _paymentTypeFromJson(String json) {
    switch (json.toLowerCase()) {
      case 'topup':
        return PaymentType.topUp;
      case 'payment':
        return PaymentType.payment;
      default:
        throw ArgumentError('Unknown payment type: $json');
    }
  }

  static String _paymentTypeToJson(PaymentType paymentType) {
    switch (paymentType) {
      case PaymentType.topUp:
        return 'topup';
      case PaymentType.payment:
        return 'payment';
    }
  }
}
