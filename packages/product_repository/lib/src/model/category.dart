import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "category_name")
  final String categoryName;

  Category({
    required this.id,
    required this.categoryName,
  });

  Category copyWith({
    int? id,
    String? categoryName,
  }) =>
      Category(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
      );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
