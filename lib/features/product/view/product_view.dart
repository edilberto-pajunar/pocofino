import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/images.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                            "170 PHP",
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
                Text(
                  "Size",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: 64.0,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12.0),
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        backgroundColor: theme.colorScheme.primary,
                        radius: 24.0,
                        child: const Text("6 oz"),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Quantity",
                  style: theme.textTheme.titleMedium,
                ),
                Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.minimize_outlined,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("1"),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: PrimaryButton(
              onPressed: () {},
              label: "Add to Cart | 170 PHP",
            ),
          ),
        ],
      ),
    );
  }
}
