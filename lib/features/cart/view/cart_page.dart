import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/cart/view/cart_view.dart';

class CartPage extends StatelessWidget {
  static String route = "cart_page_route";
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == CartStatus.success) {
          context.read<CartBloc>().add(CartInitRequested());
        }
      },
      child: const CartView(),
    );
  }
}
