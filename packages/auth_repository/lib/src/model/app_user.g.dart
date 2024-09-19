// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      mobileNumber: json['mobile_number'],
      isAdmin: json['is_admin'] as bool,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'mobile_number': instance.mobileNumber,
      'is_admin': instance.isAdmin,
    };
