import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/product/bloc/product_bloc.dart';
import 'package:pocofino/features/product/view/product_view.dart';
import 'package:product_repository/product_repository.dart';

class ProductPage extends StatelessWidget {
  static String route = "product_page_route";
  const ProductPage({
    required this.product,
    required this.cartBloc,
    super.key,
  });

  final Product product;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cartBloc,
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
      ],
      child: ProductView(
        product: product,
      ),
    );
  }
}
