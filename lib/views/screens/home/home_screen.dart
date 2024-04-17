import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.gr.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/models/coffee.dart';
import 'package:pocofino/views/widgets/tiles/product_tile.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<Coffee> coffeeList = Coffee.coffeeList;

    return Scaffold(
      body: SafeArea(
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
                    color: ColorTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Ciao!"),
                        Text(
                          "Pre-order and Pickup your Coffee",
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
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search",
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore our Menu",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 22.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductTile(
                        onTap: () => context.pushRoute(const MenuRoute()),
                        image: coffeeList[0].image,
                        category: "Hot Drinks",
                      ),
                      ProductTile(
                        onTap: () {},
                        image: coffeeList[1].image,
                        category: "Cold Drinks",
                      ),
                      ProductTile(
                        onTap: () {},
                        image: coffeeList[2].image,
                        category: "Hot Drinks",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    "Popular",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
