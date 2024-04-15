import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.gr.dart';
import 'package:pocofino/config/strings/color.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const Text("Explore our Menu"),
                  const SizedBox(height: 22.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => context.pushRoute(const MenuRoute()),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.network(
                                "https://i.pinimg.com/564x/68/cc/2e/68cc2e285303d7ec54487587ea5bd12e.jpg",
                                height: 85,
                                width: 85,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text("Hot Drinks"),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              "https://i.pinimg.com/564x/30/33/65/303365082f0e1a9c377050e73d9f245a.jpg",
                              height: 85,
                              width: 85,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text("Cold Drinks"),
                        ],
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              "https://i.pinimg.com/564x/43/c7/ce/43c7ce8223c47b0757fc6b240d582769.jpg",
                              height: 85,
                              width: 85,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text("Savories"),
                        ],
                      ),
                    ],
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
