import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/product/view/product_page.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:product_repository/product_repository.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(ProductPage.route, extra: {
              "product": product,
              "cartBloc": context.read<CartBloc>(),
            }, pathParameters: {
              "product_id": product.id.toString(),
            });
          },
          child: Container(
            height: 165.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(
                  PngImages.coldDrink,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(product.title),
        Text(
          "${product.price} PHP",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
