import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/extensions/date_time_format_extensions.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/payment_page.dart';
import 'package:pocofino/features/wallet/view/top_up_page.dart';
import 'package:pocofino/utils/strings/color.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 320,
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorTheme.primaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "WALLET",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 60.0),
                                Text(
                                  "Available Balance",
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "PHP",
                                      style:
                                          theme.textTheme.bodySmall!.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      "${state.amount}",
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: InkWell(
                              onTap: () => context.pushNamed(
                                TopUpPage.route,
                                extra: {
                                  "walletBloc": context.read<WalletBloc>(),
                                  "orderBloc": context.read<OrderBloc>(),
                                  "cartBloc": context.read<CartBloc>(),
                                },
                              ),
                              child: Container(
                                width: size.width * 0.9,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 1),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 26.0),
                                    CircleAvatar(
                                      backgroundColor: ColorTheme.primaryColor,
                                      radius: 20,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Text(
                                      "Top Up",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        color: ColorTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Transaction History",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  state.transactions.isEmpty
                      ? const Text(
                          "Track your transaction history here",
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = state.transactions[index];
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              title: Text(
                                transaction.description,
                                style: theme.textTheme.bodyMedium!.copyWith(),
                              ),
                              subtitle: Text(
                                transaction.createdAt.toFormattedString(),
                                style: theme.textTheme.labelMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: Text(
                                "${transaction.paymentType == PaymentType.topUp ? "+" : "-"} ${transaction.amount} PHP",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: transaction.paymentType ==
                                          PaymentType.topUp
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
