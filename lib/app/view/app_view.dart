import 'package:flutter/material.dart';
import 'package:pocofino/app/app_router.dart';

class AppView extends StatelessWidget {
  const AppView(
    this.appRouter, {
    super.key,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config,
    );
  }
}
