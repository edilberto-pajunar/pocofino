import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/product/bloc/product_bloc.dart';
import 'package:pocofino/features/product/view/product_view.dart';
import 'package:product_repository/product_repository.dart';

class ProductPage extends StatelessWidget {
  static String route = "product_page_route";
  const ProductPage({
    required this.product,
    required this.cartBloc,
    this.isEdit = false,
    super.key,
  });

  final Product product;
  final CartBloc cartBloc;

  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cartBloc,
        ),
        BlocProvider(
          create: (context) => ProductBloc()
            ..add(ProductInitRequested(
              quantity: product.quantity,
            )),
        ),
      ],
      child: BlocListener<CartBloc, CartState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == CartStatus.success) {
            context
              ..read<CartBloc>().add(CartInitRequested())
              ..pop();
          }
        },
        child: ProductView(
          product: product,
          isEdit: isEdit ?? false,
        ),
      ),
    );
  }
}
