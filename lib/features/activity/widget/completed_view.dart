import 'package:flutter/material.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "New to our coffee? Order now and stay updated on your order's status here.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
