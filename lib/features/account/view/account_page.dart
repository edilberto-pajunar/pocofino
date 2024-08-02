import 'package:flutter/material.dart';
import 'package:pocofino/features/account/view/account_view.dart';

class AccountPage extends StatelessWidget {
  static String route = "account_page_route";
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountView();
  }
}
