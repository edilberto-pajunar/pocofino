import 'package:flutter/material.dart';
import 'package:pocofino/features/admin/features/home/admin_home_view.dart';

class AdminHomePage extends StatelessWidget {
  static String route = "admin_home_page_route";
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminHomeView();
  }
}
