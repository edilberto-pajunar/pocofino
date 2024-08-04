import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:product_repository/product_repository.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.onTap,
    required this.product,
  });

  final Function() onTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              product.img,
              height: 165,
              width: 165,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            product.title,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 10.0),
          Text(
            "₱ ${product.price}",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
