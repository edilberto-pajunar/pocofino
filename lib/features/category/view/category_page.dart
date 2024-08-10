import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/category/view/category_view.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';

class CategoryPage extends StatelessWidget {
  static String route = "category_page_route";
  const CategoryPage({
    required this.category,
    required this.menuBloc,
    super.key,
  });

  final String category;
  final MenuBloc menuBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: menuBloc..add(MenuProductsCategoryRequested(category)),
      child: CategoryView(
        category: category,
      ),
    );
  }
}
