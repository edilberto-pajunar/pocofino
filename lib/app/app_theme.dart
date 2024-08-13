import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: ColorTheme.primaryColor,
      secondary: ColorTheme.secondaryColor,
      surface: ColorTheme.backgroundColor,
      primaryContainer: ColorTheme.greyColor,
    ),
    scaffoldBackgroundColor: ColorTheme.backgroundColor,
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorTheme.backgroundColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorTheme.backgroundColor,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: ColorTheme.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      centerTitle: true,
    ),
    dividerTheme: DividerThemeData(
      color: ColorTheme.greyColor,
    ),
    fontFamily: "Avenir",
  );
}
