import 'package:equatable/equatable.dart';

enum CoffeeType { hot, cold }

class Coffee extends Equatable {
  const Coffee({
    required this.id,
    required this.title,
    required this.description,
    required this.size,
    required this.price,
    required this.image,
    required this.coffeeType,
  });

  final String id;
  final String title;
  final String description;
  final List<int> size;
  final double price;
  final String image;
  final CoffeeType coffeeType;

  @override
  List<Object> get props => [
        title,
        description,
        size,
        price,
        image,
      ];

  static List<Coffee> coffeeList = [
    const Coffee(
      id: "1",
      title: "Cappucino",
      description: "Espresso shot with steamed milk and foam milk",
      size: [6, 16],
      price: 170.0,
      image: "https://i.pinimg.com/564x/33/44/2e/33442e58a74503c7cef4fc437a4ebc8e.jpg",
      coffeeType: CoffeeType.cold,
    ),
    const Coffee(
      id: "2",
      title: "Caffee",
      description: "Authentic Italian espresso shot",
      size: [6, 16],
      price: 120.0,
      image: "https://i.pinimg.com/564x/68/cc/2e/68cc2e285303d7ec54487587ea5bd12e.jpg",
      coffeeType: CoffeeType.cold,
    ),
    const Coffee(
      id: "3",
      title: "Tre Latte",
      description: "Layers of espresso , steamed milk for a smooth and rich velvety textured drink",
      size: [6, 16],
      price: 210.0,
      image: "https://i.pinimg.com/564x/67/a0/0e/67a00e7433f4fec37f1c8e6d46e366e8.jpg",
      coffeeType: CoffeeType.hot,
    ),
  ];
}
