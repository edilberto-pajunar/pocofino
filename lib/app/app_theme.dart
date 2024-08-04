import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: ColorTheme.primaryColor,
      secondary: ColorTheme.secondaryColor,
      surface: ColorTheme.backgroundColor,
    ),
    
    
  );
}
