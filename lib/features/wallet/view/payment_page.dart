import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/payment_view.dart';

class PaymentPage extends StatelessWidget {
  static String route = "payment_page_route";
  const PaymentPage({
    super.key,
    required this.walletBloc,
  });

  final WalletBloc walletBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: walletBloc,
      child: const PaymentView(),
    );
  }
}
