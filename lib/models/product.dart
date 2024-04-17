import 'package:equatable/equatable.dart';

enum ProductType { hot, cold, savories }

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    this.size,
    required this.price,
    required this.image,
    required this.productType,
  });

  final String id;
  final String title;
  final String description;
  final List<int>? size;
  final double price;
  final String image;
  final ProductType productType;

  @override
  List<Object?> get props => [
        title,
        description,
        size,
        price,
        image,
      ];

  static List<Product> productList = [
    const Product(
      id: "1",
      title: "Cappucino",
      description: "Espresso shot with steamed milk and foam milk",
      size: [6, 16],
      price: 170.0,
      image: "https://i.pinimg.com/564x/33/44/2e/33442e58a74503c7cef4fc437a4ebc8e.jpg",
      productType: ProductType.hot,
    ),
    const Product(
      id: "2",
      title: "Caffee",
      description: "Authentic Italian espresso shot",
      size: [6, 16],
      price: 120.0,
      image: "https://i.pinimg.com/564x/68/cc/2e/68cc2e285303d7ec54487587ea5bd12e.jpg",
      productType: ProductType.cold,
    ),
    const Product(
      id: "3",
      title: "Panini Classico",
      description: "Typical Savory Classico",
      price: 210.0,
      image: "https://i.pinimg.com/564x/43/c7/ce/43c7ce8223c47b0757fc6b240d582769.jpg",
      productType: ProductType.savories,
    ),
  ];
}
