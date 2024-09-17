// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      walletId: (json['wallet_id'] as num).toInt(),
      type: json['type'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toInt(),
      paymentType:
          Transaction._paymentTypeFromJson(json['payment_type'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'wallet_id': instance.walletId,
      'type': instance.type,
      'description': instance.description,
      'amount': instance.amount,
      'payment_type': Transaction._paymentTypeToJson(instance.paymentType),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
