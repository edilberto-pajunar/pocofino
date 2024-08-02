import 'package:flutter/material.dart';

class OngoingView extends StatelessWidget {
  const OngoingView({super.key});

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
