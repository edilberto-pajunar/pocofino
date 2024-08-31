import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class TopUpView extends StatefulWidget {
  const TopUpView({super.key});

  @override
  State<TopUpView> createState() => _TopUpViewState();
}

class _TopUpViewState extends State<TopUpView> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  final amounts = [200, 300, 500, 1000, 3000, 5000];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: formKey,
          onChanged: () => formKey.currentState?.save(),
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
                initialValue: amounts[0],
                options: amounts
                    .map((amount) => FormBuilderChipOption(
                          avatar: Container(),
                          value: amount,
                          child: Container(
                              width: 50,
                              decoration: const BoxDecoration(),
                              child: Center(child: Text(amount.toString()))),
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
                onPressed: () {
                  final value = formKey.currentState?.value;
                  context
                      .read<WalletBloc>()
                      .add(WalletTopUpRequested(value?["amount"]));
                },
                label: "TOP UP",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
