import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/category/view/category_view.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:product_repository/product_repository.dart';

class CategoryPage extends StatelessWidget {
  static String route = "category_page_route";
  const CategoryPage({
    required this.category,
    required this.menuBloc,
    required this.cartBloc,
    super.key,
  });

  final Category category;
  final MenuBloc menuBloc;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cartBloc,
        ),
        BlocProvider.value(
          value: menuBloc,
        ),
      ],
      child: BlocListener<MenuBloc, MenuState>(
        listener: (context, state) {
          if (state.status == MenuStatus.failure) {
            Fluttertoast.showToast(msg: state.error!);
          }
        },
        child: CategoryView(
          category: category,
          cartBloc: cartBloc,
        ),
      ),
    );
  }
}
