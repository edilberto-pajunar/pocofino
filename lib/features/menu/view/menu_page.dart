import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:pocofino/features/menu/view/menu_view.dart';
import 'package:product_repository/product_repository.dart';

class MenuPage extends StatelessWidget {
  static String route = "menu_page_route";
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(
        productRepository: context.read<ProductRepository>(),
      )..add(MenuInitRequested()),
      child: BlocListener<MenuBloc, MenuState>(
        listener: (context, state) {
          if (state.status == MenuStatus.failure) {
            Fluttertoast.showToast(msg: state.error!);
          }
        },
        child: const MenuView(),
      ),
    );
  }
}
