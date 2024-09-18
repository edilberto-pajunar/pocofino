import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/activity/bloc/activity_bloc.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/order/view/order_page.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/layout/bloc/timer_bloc.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/features/cart/widget/order_tile.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';
import 'package:product_repository/product_repository.dart';

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
          final totalPrice =
              Product.totalAmount(state.products).toStringAsFixed(2);

          return BottomAppBar(
            height: 190,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const PrimaryTextField(
                    name: "voucher",
                    label: "Apply a voucher",
                    hintText: "POCOFINO",
                  ),
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
                        "₱ $totalPrice",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  PrimaryButton(
                    onPressed: state.products.isEmpty
                        ? null
                        : () {
                            context.pushNamed(OrderPage.route, extra: {
                              "products": state.products,
                              "orderBloc": context.read<OrderBloc>(),
                              "cartBloc": context.read<CartBloc>(),
                              "walletBloc": context.read<WalletBloc>(),
                              "timerBloc": context.read<TimerBloc>(),
                            });
                          },
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
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
