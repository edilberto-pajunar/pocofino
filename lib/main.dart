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
          titleLarge: TextStyle(
            color: ColorTheme.blackColor,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: ColorTheme.blackColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: ColorTheme.blackColor,
            fontSize: 18.0,
          ),
          bodyLarge: TextStyle(
            color: ColorTheme.blackColor,
            fontSize: 16.0,
          ),
          bodyMedium: TextStyle(
            color: ColorTheme.blackColor,
            fontSize: 14.0,
          ),
          bodySmall: TextStyle(
            color: ColorTheme.subtitleColor,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
