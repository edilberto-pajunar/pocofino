import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/models/product.dart';
import 'package:pocofino/widgets/tiles/product_tile.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HOT DRINKS",
          style: theme.textTheme.titleLarge!.copyWith(
            color: ColorTheme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ProductTile(
            onTap: () {},
            product: product,
          ),
        ),
      ),
    );
  }
}
