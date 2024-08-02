import 'package:flutter/material.dart';
import 'package:pocofino/features/menu/view/product_view.dart';

class ProductPage extends StatelessWidget {
  static String route = "product_page_route";
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductView();
  }
}
