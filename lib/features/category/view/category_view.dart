import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:pocofino/widgets/tiles/product_tile.dart';
import 'package:product_repository/product_repository.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    required this.category,
    required this.cartBloc,
    super.key,
  });

  final Category category;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.categoryName.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocSelector<MenuBloc, MenuState, List<Product>>(
          selector: (state) => state.products
              .where((product) => product.category.id == category.id)
              .toList(),
          builder: (context, products) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220.0,
                crossAxisSpacing: 12.0,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(
                  product: product,
                  cartBloc: context.read<CartBloc>(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
