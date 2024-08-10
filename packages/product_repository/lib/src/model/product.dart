import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final num price;
  // final String img;
  final bool popular;
  // final String category;
  // final List<double> ounces;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    // required this.img,
    this.popular = false,
    // required this.category,
    // required this.ounces,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        // img,
        popular,
        // ounces,
      ];

  static final List<Product> products = [
    const Product(
      id: 1,
      title: 'Latte',
      description: 'A smooth and creamy coffee with steamed milk.',
      price: 3,
      // img: 'https://example.com/latte.jpg',
      popular: true,
      // category: 'hot',
      // ounces: [6, 16],
    ),
    const Product(
      id: 2,
      title: 'Iced Coffee',
      description: 'Chilled coffee served over ice.',
      price: 2,
      // img: 'https://example.com/iced_coffee.jpg',
      popular: true,
      // category: 'cold',
      // ounces: [6, 16],
    ),
    const Product(
      id: 3,
      title: 'Cappuccino',
      description: 'Espresso with steamed milk and foam.',
      price: 3,
      // img: 'https://example.com/cappuccino.jpg',
      popular: false,
      // category: 'hot',
      // ounces: [6, 16],
    ),
    const Product(
      id: 4,
      title: 'Muffin',
      description: 'A soft and fluffy baked good, perfect with coffee.',
      price: 1,
      // img: 'https://example.com/muffin.jpg',
      popular: true,
      // category: 'savories',
      // ounces: [6, 16],
    ),
    const Product(
      id: 5,
      title: 'Smoothie',
      description: 'A refreshing blend of fruits and yogurt.',
      price: 4,
      // img: 'https://example.com/smoothie.jpg',
      popular: true,
      // category: 'cold',
      // ounces: [6, 16],
    ),
  ];
}
