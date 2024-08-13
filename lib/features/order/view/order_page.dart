import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocofino/app/view/bloc/app_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/order/view/order_view.dart';
import 'package:product_repository/product_repository.dart';

class OrderPage extends StatelessWidget {
  static String route = "order_page_route";
  const OrderPage({
    required this.products,
    super.key,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(
        productRepository: context.read<ProductRepository>(),
        token: context.read<AppBloc>().state.token!,
      ),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.status == OrderStatus.failed) {
            Fluttertoast.showToast(msg: state.error!);
          }
        },
        child: OrderView(
          products: products,
        ),
      ),
    );
  }
}
