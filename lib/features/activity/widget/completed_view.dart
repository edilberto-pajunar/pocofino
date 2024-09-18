import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/extensions/date_time_format_extensions.dart';
import 'package:pocofino/features/activity/bloc/activity_bloc.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        return state.orders.isEmpty
            ? const Center(
                child: Text(
                  "New to our coffee? Order now and stay updated on your order's status here.",
                  textAlign: TextAlign.center,
                ),
              )
            : _buildOrders(context, state);
      },
    );
  }

  Widget _buildOrders(context, ActivityState state) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              itemCount: state.orders.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(
                height: 48.0,
              ),
              itemBuilder: (context, index) {
                final order = state.orders[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order ${index + 1}"),
                    Column(
                      children: order.products!.map((product) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "${product.quantity}x ${product.title}",
                            style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "6 oz",
                            style: theme.textTheme.labelSmall!.copyWith(),
                          ),
                          leading: Image.network(
                            "https://i.pinimg.com/564x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg",
                          ),
                          trailing: Text(
                            "₱ ${product.totalPrice().toStringAsFixed(2)}",
                            style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        text: TextSpan(
                          text: "Order Total: ",
                          style: theme.textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "₱ ${state.orders[0].totalAmount}",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Placed",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(state.orders[0].createdAt!.toFormattedString()),
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
