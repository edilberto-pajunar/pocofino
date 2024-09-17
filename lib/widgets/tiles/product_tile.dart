// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_repository/product_repository.dart';

import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/product/view/product_page.dart';
import 'package:pocofino/utils/strings/images.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.cartBloc,
  }) : super(key: key);

  final Product product;
  final CartBloc cartBloc;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  int quantity() {
    final cartBloc = context.read<CartBloc>();

    for (var item in cartBloc.state.products) {
      if (item.id == widget.product.id) {
        return item.quantity;
      }
    }

    return widget.product.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final cartBloc = context.read<CartBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(ProductPage.route, extra: {
              "product": widget.product.copyWith(
                quantity: quantity(),
              ),
              "cartBloc": cartBloc,
            }, pathParameters: {
              "product_id": widget.product.id.toString(),
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
        Text(widget.product.title),
        Text(
          "${widget.product.price} PHP",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
