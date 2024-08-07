import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:pocofino/widgets/tiles/product_tile.dart';
import 'package:product_repository/product_repository.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    required this.category,
    super.key,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocSelector<MenuBloc, MenuState, List<Product>>(
          selector: (state) => state.products,
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
                return ProductTile(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}
