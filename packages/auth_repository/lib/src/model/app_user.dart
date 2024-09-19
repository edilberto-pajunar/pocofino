import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'app_user.g.dart';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

@JsonSerializable()
class AppUser {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "mobile_number")
  final dynamic mobileNumber;
  @JsonKey(name: "is_admin")
  final bool isAdmin;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.mobileNumber,
    required this.isAdmin,
  });

  AppUser copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? createdAt,
    String? updatedAt,
    dynamic mobileNumber,
    bool? isAdmin,
  }) =>
      AppUser(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        isAdmin: isAdmin ?? this.isAdmin,
      );

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
