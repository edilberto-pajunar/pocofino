import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/order/view/contact_page.dart';
import 'package:pocofino/features/order/view/location_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/tiles/order_tile.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "ORDER",
              style: theme.textTheme.titleLarge!.copyWith(
                color: ColorTheme.primaryColor,
              ),
            ),
            Text(
              "Available only in Pick-up",
              style: theme.textTheme.bodySmall!.copyWith(
                color: ColorTheme.subtitleColor,
              ),
            ),
          ],
        ),
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
              // onPressed: () => context.pushRoute(const OrderSuccessRoute()),
              onPressed: () {},
              label: "Place Order",
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () => context.pushNamed(ContactPage.route),
                            leading: Icon(
                              Icons.person,
                              color: ColorTheme.primaryColor,
                            ),
                            title: Text(
                              "Contact Information",
                              style: theme.textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              "Add contact information",
                              style: theme.textTheme.bodySmall,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: () => context.pushNamed(LocationPage.route),
                            leading: Icon(
                              Icons.pin_drop_sharp,
                              color: ColorTheme.primaryColor,
                            ),
                            title: Text(
                              "Pick up at",
                              style: theme.textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              "Select branch",
                              style: theme.textTheme.bodySmall,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.watch_later_rounded,
                              color: ColorTheme.primaryColor,
                            ),
                            title: Text(
                              "Pick up in",
                              style: theme.textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              "Select time",
                              style: theme.textTheme.bodySmall,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Order",
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 30.0),
                            const OrderTile(
                              image:
                                  "https://i.pinimg.com/564x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg",
                              title: "Iced Pocofino Latte",
                              price: "490",
                              quantity: 2,
                              size: "6",
                              edit: true,
                            ),
                            const SizedBox(height: 30.0),
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyMedium,
                                children: [
                                  const TextSpan(
                                      text: "Leave a note to baristas "),
                                  TextSpan(
                                    text: "(Optional)",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: ColorTheme.subtitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText:
                                    "Feel Free to reach out if you have requests",
                                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                                  color: ColorTheme.subtitleColor,
                                ),
                              ),
                            ),
                          ],
                        ),
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
