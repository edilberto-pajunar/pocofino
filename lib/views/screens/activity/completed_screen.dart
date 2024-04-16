import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActivityCompletedScreen extends StatelessWidget {
  const ActivityCompletedScreen({super.key});

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
