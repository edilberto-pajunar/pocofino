import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/top_up_view.dart';

class TopUpPage extends StatelessWidget {
  static String route = "top_up_page_route";
  const TopUpPage({
    required this.walletBloc,
    super.key,
  });

  final WalletBloc walletBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: walletBloc,
      child: const TopUpView(),
    );
  }
}
