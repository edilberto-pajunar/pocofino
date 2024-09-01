import 'package:flutter/material.dart';
import 'package:pocofino/features/account/view/app_settings_view.dart';

class AppSettingsPage extends StatelessWidget {
  static String route = "app_settings_page";
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSettingsView();
  }
}
