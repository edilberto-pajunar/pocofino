import 'package:flutter/material.dart';
import 'package:pocofino/features/cart/view/order_view.dart';

class OrderPage extends StatelessWidget {
  static String route = "order_page_route";
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderView();
  }
}
