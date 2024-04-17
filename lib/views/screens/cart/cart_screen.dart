import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.gr.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/views/widgets/buttons/primary_button.dart';
import 'package:pocofino/views/widgets/tiles/order_tile.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CART"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 102,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₱ 660",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            PrimaryButton(
              onPressed: () => context.pushRoute(const OrderRoute()),
              label: "Checkout",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Order",
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 40.0),
            const OrderTile(
              image: "https://i.pinimg.com/564x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg",
              title: "Iced Pocofino Latte",
              price: "490",
              quantity: 2,
              size: "6",
              edit: true,
            ),
          ],
        ),
      ),
    );
  }
}
