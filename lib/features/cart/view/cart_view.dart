import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/order/view/order_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/tiles/order_tile.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CART"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Order",
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 40.0),
                          const OrderTile(
                            image:
                                "https://i.pinimg.com/564x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg",
                            title: "Iced Pocofino Latte",
                            price: "490",
                            quantity: 2,
                            size: "6",
                            edit: true,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                            onPressed: () => context.pushNamed(OrderPage.route),
                            label: "Checkout",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
