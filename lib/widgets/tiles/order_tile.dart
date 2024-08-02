import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.image,
    required this.title,
    required this.size,
    this.edit = false,
    required this.price,
    required this.quantity,
  });

  final String image;
  final String title;
  final String size;
  final int quantity;
  final bool edit;
  final String price;

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
          image,
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
                "${quantity}x $title",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$size oz",
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 14.0),
              Visibility(
                visible: edit,
                child: InkWell(
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
          "₱ $price ",
          style: theme.textTheme.titleSmall,
        ),
      ],
    );
  }
}
