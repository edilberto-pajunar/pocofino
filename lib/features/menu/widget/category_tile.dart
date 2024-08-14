import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/category/view/category_page.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:product_repository/product_repository.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.image,
    required this.category,
  });

  final String image;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(CategoryPage.route, extra: {
        "menuBloc": context.read<MenuBloc>(),
        "category": category,
        "cartBloc": context.read<CartBloc>(),
      }),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              image,
              height: 85,
              width: 85,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(category.categoryName),
        ],
      ),
    );
  }
}
