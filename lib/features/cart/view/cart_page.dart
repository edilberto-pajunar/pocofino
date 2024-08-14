import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/cart/view/cart_view.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';

class CartPage extends StatelessWidget {
  static String route = "cart_page_route";
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartView();
  }
}
