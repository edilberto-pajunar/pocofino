import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "REVENUE BREAKDOWN",
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 12.0),
        const Text("Total Revenue for May: \$10,000"),
        const Text("Percentage change from last month: +105% / -55%"),
        const SizedBox(height: 12.0),
        Text(
          "KEY METRICS",
          style: theme.textTheme.titleLarge,
        ),
        const Text("Number of transactions: 123"),
        const Text("Average transaction value: 55"),
      ],
    );
  }
}
