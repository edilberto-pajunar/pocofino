import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/app/view/bloc/app_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/order/view/contact_page.dart';
import 'package:pocofino/features/order/view/location_page.dart';
import 'package:pocofino/features/order/view/pick_up_time_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';
import 'package:product_repository/product_repository.dart';

class OrderView extends StatefulWidget {
  const OrderView({
    required this.products,
    super.key,
  });

  final List<Product> products;

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: FormBuilder(
                  key: _formKey,
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
                              onTap: () =>
                                  context.pushNamed(LocationPage.route),
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
                              onTap: () =>
                                  context.pushNamed(PickUpTimePage.route),
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
                              //  OrderTile(
                              //   product: product,
                              // ),
                              const SizedBox(height: 30.0),
                              const PrimaryTextField(
                                name: "note",
                                label: "Leave a note to baristas (Optional)",
                                hintText:
                                    "Feel free to reach out if you have requests",
                                maxLines: 5,
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                "Payment Option",
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 12.0),
                              FormBuilderRadioGroup(
                                name: "payment",
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                controlAffinity: ControlAffinity.trailing,
                                orientation: OptionsOrientation.vertical,
                                itemDecoration: const BoxDecoration(),
                                options: [
                                  FormBuilderFieldOption(
                                    value: "wallet",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              PngImages.wallet,
                                              width: 24.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              "Wallet",
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  FormBuilderFieldOption(
                                    value: "gcash",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              PngImages.gcash,
                                              width: 24.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              "GCash",
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  FormBuilderFieldOption(
                                    value: "maya",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              PngImages.maya,
                                              width: 24.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              "Maya",
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(24.0),
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
                            BlocListener<OrderBloc, OrderState>(
                              listener: (context, state) {
                                if (state.status == OrderStatus.success) {
                                  context
                                    ..pop()
                                    ..read<AppBloc>()
                                        .add(const AppHomeIndexChanged(1));
                                }
                              },
                              child: PrimaryButton(
                                onPressed: () => context
                                    .read<OrderBloc>()
                                    .add(OrderPlaceRequested(widget.products)),
                                label: "Place Order",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
