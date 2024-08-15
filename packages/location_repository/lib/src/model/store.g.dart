// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      openingHours: json['opening_hours'] as String,
      closingHours: json['closing_hours'] as String,
      open24Hours: json['open_24_hours'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'description': instance.description,
      'image': instance.image,
      'status': instance.status,
      'lat': instance.lat,
      'lng': instance.lng,
      'opening_hours': instance.openingHours,
      'closing_hours': instance.closingHours,
      'open_24_hours': instance.open24Hours,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
