import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
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
      bottomSheet: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return BottomAppBar(
            height: 110,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        "₱ ${state.products.fold(0.0, (sum, product) => sum + product.price)}",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  PrimaryButton(
                    onPressed: () => context.pushNamed(OrderPage.route, extra: {
                      "products": state.products,
                    }),
                    label: "Checkout",
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Order",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12.0),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12.0),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return OrderTile(
                        product: product,
                        canEdit: true,
                      );
                    },
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
