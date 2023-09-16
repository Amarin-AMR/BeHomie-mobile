import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = const Color(0xffDF0054);
  Color darkPrimaryColor = const Color(0xff480032);
  Color secondaryColor = const Color(0xffFF8B6A);
  Color accentColor = const Color(0xffFFD2BB);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: _themeClass.lightPrimaryColor,
        secondary: _themeClass.secondaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
