import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "website")
  final String? website;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lng")
  final double lng;
  @JsonKey(name: "opening_hours")
  final String openingHours;
  @JsonKey(name: "closing_hours")
  final String closingHours;
  @JsonKey(name: "open_24_hours")
  final bool? open24Hours;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  Store({
    required this.id,
    required this.name,
    required this.address,
    this.phone,
    this.email,
    this.website,
    this.description,
    this.image,
    required this.status,
    required this.lat,
    required this.lng,
    required this.openingHours,
    required this.closingHours,
    this.open24Hours,
    this.createdAt,
    this.updatedAt,
  });

  String formattedTime(String hours) {
    final DateTime dateTime = DateFormat("HH:mm").parse(hours);
    String formattedTime = DateFormat("h:mma").format(dateTime).toLowerCase();

    return formattedTime;
  }

  Store copyWith({
    int? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? website,
    String? description,
    String? image,
    String? status,
    double? lat,
    double? lng,
    String? openingHours,
    String? closingHours,
    bool? open24Hours,
    String? createdAt,
    String? updatedAt,
  }) =>
      Store(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        website: website ?? this.website,
        description: description ?? this.description,
        image: image ?? this.image,
        status: status ?? this.status,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        openingHours: openingHours ?? this.openingHours,
        closingHours: closingHours ?? this.closingHours,
        open24Hours: open24Hours ?? this.open24Hours,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
