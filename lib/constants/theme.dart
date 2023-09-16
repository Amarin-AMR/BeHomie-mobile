import 'package:flutter/material.dart';
import 'color.dart';

Colour _colour = Colour();

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: _colour.lightPrimaryColor, secondary: _colour.secondaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _colour.darkPrimaryColor,
    ),
  );
}
