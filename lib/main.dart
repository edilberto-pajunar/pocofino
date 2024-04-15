import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.dart';
import 'package:pocofino/config/strings/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: ThemeData(
        // colorScheme: ColorScheme(
        //   brightness: Brightness.light,
        //   primary: ColorTheme.primaryColor,
        //   onPrimary: ColorTheme.primaryColor.withOpacity(0.3),
        //   secondary: ColorTheme.secondaryColor,
        //   onSecondary: ColorTheme.secondaryColor.withOpacity(0.3),
        //   error: ColorTheme.errorColor,
        //   onError: ColorTheme.errorColor.withOpacity(0.3),
        //   background: ColorTheme.backgroundColor,
        //   onBackground: ColorTheme.backgroundColor.withOpacity(0.3),
        //   surface: ColorTheme.backgroundColor,
        //   onSurface: ColorTheme.backgroundColor.withOpacity(0.3),
        //   onPrimaryContainer: ColorTheme.blackColor,
        // ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: ColorTheme.blackColor,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
