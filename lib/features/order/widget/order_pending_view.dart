import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/layout/bloc/timer_bloc.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class OrderPendingView extends StatefulWidget {
  const OrderPendingView({
    required this.amount,
    super.key,
  });

  final double amount;

  @override
  State<OrderPendingView> createState() => _OrderPendingViewState();
}

class _OrderPendingViewState extends State<OrderPendingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TimerBloc, TimerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Your order is being processed"),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: (3 - state.duration) / 3,
                ),
                const SizedBox(height: 12.0),
                PrimaryButton(
                  onPressed: () {
                    context.read<TimerBloc>().add(const TimerReset());
                  },
                  label: "Cancel",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
