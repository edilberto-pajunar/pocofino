import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/product/bloc/product_bloc.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:product_repository/product_repository.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomSheet: BottomAppBar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocSelector<ProductBloc, ProductState, int>(
              selector: (state) => state.quantity,
              builder: (context, quantity) {
                return PrimaryButton(
                  onPressed: quantity == 0
                      ? null
                      : () {
                          context
                            ..read<CartBloc>()
                                .add(CartProductAdded(product.copyWith(
                              quantity: quantity,
                            )))
                            ..pop();
                        },
                  label: "Add to Cart | ${product.price} PHP",
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            PngImages.coldDrink,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cappucino",
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            "Espresso shot with steamed milk and foam milk",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${product.price} PHP",
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const Text("Base price"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                /// TODO: UDPATE ONCE SIZE IS OKAY
                // Text(
                //   "Size",
                //   style: theme.textTheme.titleMedium,
                // ),
                // SizedBox(
                //   height: 64.0,
                //   child: ListView.separated(
                //     physics: const NeverScrollableScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: 2,
                //     separatorBuilder: (context, index) =>
                //         const SizedBox(width: 12.0),
                //     itemBuilder: (context, index) {
                //       return CircleAvatar(
                //         backgroundColor: theme.colorScheme.primary,
                //         radius: 24.0,
                //         child: const Text("6 oz"),
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(height: 24.0),
                Text(
                  "Quantity",
                  style: theme.textTheme.titleMedium,
                ),
                BlocSelector<ProductBloc, ProductState, int>(
                  selector: (state) => state.quantity,
                  builder: (context, quantity) {
                    return Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          onPressed: quantity == 0
                              ? null
                              : () => context
                                  .read<ProductBloc>()
                                  .add(ProductQuantityDecremented()),
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text("$quantity"),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          onPressed: () => context
                              .read<ProductBloc>()
                              .add(ProductQuantityIncremented()),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
