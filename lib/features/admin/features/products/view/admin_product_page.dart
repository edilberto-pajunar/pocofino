import 'package:flutter/material.dart';
import 'package:pocofino/features/admin/features/products/view/admin_product_view.dart';

class AdminProductPage extends StatelessWidget {
  static String route = "admin_page_route";
  const AdminProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminProductView();
  }
}
