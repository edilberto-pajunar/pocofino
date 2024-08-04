import 'package:flutter/material.dart';
import 'package:pocofino/features/product/view/product_view.dart';

class ProductPage extends StatelessWidget {
  static String route = "product_page_route";
  const ProductPage({
    required this.product,
    super.key,
  });

  final String product;

  @override
  Widget build(BuildContext context) {
    return const ProductView();
  }
}
