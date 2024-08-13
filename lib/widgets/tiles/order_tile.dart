import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:product_repository/product_repository.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.product,
    this.canEdit = false,
  });

  final Product product;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
          visualDensity: VisualDensity.compact,
        ),
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
              Text(
                "${product.quantity}x ${product.title}",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "6 oz",
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 14.0),
              Visibility(
                visible: canEdit,
                child: GestureDetector(
                  onTap: () {},
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
            ],
          ),
        ),
        const SizedBox(width: 30.0),
        Text(
          "₱ ${product.price} ",
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
