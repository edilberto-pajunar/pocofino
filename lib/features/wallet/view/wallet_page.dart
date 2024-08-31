import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_repository/payment_repository.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/wallet_view.dart';

class WalletPage extends StatelessWidget {
  static String route = "wallet_page_route";
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc(
        paymentRepository: context.read<PaymentRepository>(),
      )..add(WalletInitRequested()),
      child: const WalletView(),
    );
  }
}
