import 'package:flutter/material.dart';

class ProductCategoryTile extends StatelessWidget {
  const ProductCategoryTile({
    super.key,
    required this.onTap,
    required this.image,
    required this.category,
  });

  final Function() onTap;
  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(
              image,
              height: 85,
              width: 85,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(category),
        ],
      ),
    );
  }
}
