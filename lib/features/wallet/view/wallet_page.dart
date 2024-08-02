import 'package:flutter/material.dart';
import 'package:pocofino/features/wallet/view/wallet_view.dart';

class WalletPage extends StatelessWidget {
  static String route = "wallet_page_route";
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalletView();
  }
}
