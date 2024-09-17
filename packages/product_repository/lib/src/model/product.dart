import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:product_repository/src/model/category.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  // final String img;
  final bool popular;
  final int quantity;
  final Category category;
  
  // final List<double> ounces;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    // required this.img,
    this.popular = false,
    this.quantity = 0,
    required this.category,
    // required this.ounces,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    // String? img,
    bool? popular,
    int? quantity,
    Category? category,
    // List<double>? ounces,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      // img: img ?? this.img,
      popular: popular ?? this.popular,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      // ounces: ounces ?? this.ounces,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        // img,
        popular,
        quantity,
        category,
        // ounces,
      ];

  /// [totalAmount] is the sum of the price of all products
  static double totalAmount(List<Product> products) {
    return products.fold(0.0, (total, product) => total + product.totalPrice());
  }

  /// [totalPrice] is the price of the product multiplied by the quantity
  double totalPrice() {
    return price * quantity;
  }

  // static final List<Product> products = [
  //   const Product(
  //     id: 1,
  //     title: 'Latte',
  //     description: 'A smooth and creamy coffee with steamed milk.',
  //     price: 3,
  //     // img: 'https://example.com/latte.jpg',
  //     popular: true,
  //     // category: 'hot',
  //     // ounces: [6, 16],
  //   ),
  //   const Product(
  //     id: 2,
  //     title: 'Iced Coffee',
  //     description: 'Chilled coffee served over ice.',
  //     price: 2,
  //     // img: 'https://example.com/iced_coffee.jpg',
  //     popular: true,
  //     // category: 'cold',
  //     // ounces: [6, 16],
  //   ),
  //   const Product(
  //     id: 3,
  //     title: 'Cappuccino',
  //     description: 'Espresso with steamed milk and foam.',
  //     price: 3,
  //     // img: 'https://example.com/cappuccino.jpg',
  //     popular: false,
  //     // category: 'hot',
  //     // ounces: [6, 16],
  //   ),
  //   const Product(
  //     id: 4,
  //     title: 'Muffin',
  //     description: 'A soft and fluffy baked good, perfect with coffee.',
  //     price: 1,
  //     // img: 'https://example.com/muffin.jpg',
  //     popular: true,
  //     // category: 'savories',
  //     // ounces: [6, 16],
  //   ),
  //   const Product(
  //     id: 5,
  //     title: 'Smoothie',
  //     description: 'A refreshing blend of fruits and yogurt.',
  //     price: 4,
  //     // img: 'https://example.com/smoothie.jpg',
  //     popular: true,
  //     // category: 'cold',
  //     // ounces: [6, 16],
  //   ),
  // ];
}
