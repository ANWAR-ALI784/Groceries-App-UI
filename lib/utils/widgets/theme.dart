import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    primaryColorLight: Colors.lightGreen,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: greyColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: MyTheme.CreamColor, // 🌟 Accent color here
      primary: Colors.lightGreen,
    ),
    textTheme: Theme.of(context).textTheme.copyWith(headlineSmall: TextStyle(color: Colors.white)),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    primaryColorDark: Colors.lightGreen,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: MyTheme.lightBulish,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
      secondary: Colors.white, // 🌟 Accent color for dark theme
      primary: Colors.lightGreen,
    ),
    textTheme: Theme.of(context).textTheme,
  );

  // Other colors
  static Color CreamColor = const Color(0xff403b58);
  static Color darkCreamColor = Colors.teal;
  static Color Bulish = const Color(0xfff5f5f5);
  static Color lightBulish = Colors.blueGrey;
  static Color greyColor= Colors.grey;
}
