import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOT DRINKS"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://i.pinimg.com/564x/55/a8/31/55a8313ea7a728f6896a515aff8292dd.jpg",
                height: 165,
                width: 165,
              ),
              const SizedBox(height: 10.0),
              const Text("Cappuccino"),
              const SizedBox(height: 10.0),
              const Text("₱ 170"),
            ],
          ),
        ),
      ),
    );
  }
}
