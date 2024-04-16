import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/views/widgets/buttons/primary_button.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        child: PrimaryButton(
          label: "Add to Cart | ₱ 490",
          onPressed: () => context.maybePop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                "https://i.pinimg.com/564x/21/96/e8/2196e8c9c4b892e429e48f8717276f81.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Positioned(
                top: 50,
                left: 20,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cappucino",
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      "₱ 170",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: ColorTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Espresso shot with steamd milk and foam milk",
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: ColorTheme.subtitleColor,
                  ),
                ),
                const SizedBox(height: 50.0),
                const Text("Size"),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorTheme.primaryColor,
                      child: Text(
                        "6 oz",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    CircleAvatar(
                      backgroundColor: ColorTheme.greyColor,
                      child: Text(
                        "16 oz",
                        style: theme.textTheme.bodyMedium!.copyWith(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Text("Quantity"),
                Row(
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        color: ColorTheme.greyColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Icon(Icons.minimize_outlined),
                    ),
                    const SizedBox(width: 15.0),
                    const Text("1"),
                    const SizedBox(width: 15.0),
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        color: ColorTheme.primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
