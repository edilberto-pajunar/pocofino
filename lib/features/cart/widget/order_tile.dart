import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/product/view/product_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:product_repository/product_repository.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        // Checkbox(
        //   value: false,
        //   onChanged: (val) {},
        //   visualDensity: VisualDensity.compact,
        // ),
        Image.network(
          "https://i.pinimg.com/564x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg",
          height: 70,
          width: 70,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${product.quantity}x ${product.title}",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "₱ ${product.totalPrice().toStringAsFixed(2)} ",
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "6 oz",
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 14.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => context.pushNamed(ProductPage.route, extra: {
                      "product": product,
                      "cartBloc": context.read<CartBloc>(),
                      "isEdit": true,
                    }, pathParameters: {
                      "product_id": product.id.toString(),
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15.0,
                            color: ColorTheme.primaryColor,
                          ),
                          Text(
                            "Edit",
                            style: theme.textTheme.bodySmall!.copyWith(
                              color: ColorTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => context
                        .read<CartBloc>()
                        .add(CartProductRemoved(product)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 15.0,
                            color: ColorTheme.errorColor,
                          ),
                          Text(
                            "Remove",
                            style: theme.textTheme.bodySmall!.copyWith(
                              color: ColorTheme.errorColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
