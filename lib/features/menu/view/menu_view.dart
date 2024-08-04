import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:pocofino/features/product/view/product_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:pocofino/widgets/tiles/product_category_tile.dart';
import 'package:product_repository/product_repository.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final GlobalKey<FormFieldState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 230,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(PngImages.banner),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Ciao!"),
                                const SizedBox(height: 12.0),
                                Text(
                                  "Pre-order and Pickup your Coffee",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: ColorTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(PngImages.pocofino),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: const Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: FormBuilder(
                            key: _formKey,
                            child: FormBuilderTextField(
                              name: "search",
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: const BorderSide(
                                    width: 0.0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: theme.colorScheme.primary,
                                ),
                                hintText: "Search",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore our Menu",
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductCategoryTile(
                          onTap: () {
                            context
                                .read<ProductRepository>()
                                .setProducts(Product.products);
                          },
                          image: PngImages.hotDrink,
                          category: "Hot Drinks",
                        ),
                        ProductCategoryTile(
                          onTap: () {},
                          image: PngImages.coldDrink,
                          category: "Cold Drinks",
                        ),
                        ProductCategoryTile(
                          onTap: () {},
                          image: PngImages.savory,
                          category: "Savories",
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      "Popular",
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12.0),
                    BlocSelector<MenuBloc, MenuState, List<Product>>(
                      selector: (state) => state.products,
                      builder: (context, products) {
                        return SizedBox(
                          child: GridView.builder(
                            itemCount: products.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 220.0,
                              crossAxisSpacing: 12.0,
                            ),
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.pushNamed(
                                        ProductPage.route,
                                        pathParameters: {
                                          "product_id": product.id,
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 165.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            PngImages.coldDrink,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(product.title),
                                  Text(
                                    "${product.price} PHP",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
