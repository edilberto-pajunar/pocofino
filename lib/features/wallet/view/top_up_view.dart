import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/payment_page.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class TopUpView extends StatefulWidget {
  const TopUpView({super.key});

  @override
  State<TopUpView> createState() => _TopUpViewState();
}

class _TopUpViewState extends State<TopUpView> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  final amounts = [
    200.00,
    300.00,
    500.00,
    1000.00,
    3000.00,
    5000.00,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up"),
      ),
      body: FormBuilder(
        key: formKey,
        onChanged: () => formKey.currentState?.save(),
        child: BlocConsumer<WalletBloc, WalletState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.paymentStatus == PaymentStatus.generated) {
              final value = formKey.currentState?.value;

              context.pushNamed(
                PaymentPage.route,
                extra: {
                  "amount": value?["amount"],
                  "paymentType": PaymentType.topUp,
                  "orderBloc": context.read<OrderBloc>(),
                  "walletBloc": context.read<WalletBloc>(),
                  "cartBloc": context.read<CartBloc>(),
                },
              );
            }
          },
          builder: (context, state) {
            if (state.status == WalletStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Select Amount PHP"),
                  const SizedBox(height: 12.0),
                  FormBuilderChoiceChip(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    name: "amount",
                    alignment: WrapAlignment.center,
                    spacing: 24.0,
                    options: amounts
                        .map((amount) => FormBuilderChipOption(
                              avatar: Container(),
                              value: amount,
                              child: Container(
                                  width: 50,
                                  decoration: const BoxDecoration(),
                                  child:
                                      Center(child: Text(amount.toString()))),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 12.0),
                  const Text("Select payment method"),
                  const SizedBox(height: 12.0),
                  FormBuilderRadioGroup(
                    controlAffinity: ControlAffinity.trailing,
                    name: "payment",
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    options: [
                      FormBuilderFieldOption(
                        value: "maya",
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(PngImages.maya),
                          title: Text(
                            "Maya",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onPressed: () async {
                      final value = formKey.currentState?.value;

                      context
                          .read<WalletBloc>()
                          .add(WalletPaymentGenerated(value?["amount"]));

                      // context
                      //   ..read<WalletBloc>().add(
                      //       WalletPaymentAddBalanceRequested(
                      //           value?["amount"] as double))
                      //   ..read<WalletBloc>().add(WalletInitRequested())
                      //   ..pop();
                    },
                    label: "TOP UP",
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
