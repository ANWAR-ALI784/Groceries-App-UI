import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
  static ThemeData LightTheme(BuildContext context)=> ThemeData(
  appBarTheme: (const AppBarTheme(color: Colors.white)
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: Theme.of(context).textTheme,
  primarySwatch: Colors.deepPurple,
  fontFamily:GoogleFonts.poppins().fontFamily,
  );
  static ThemeData darkTheme(BuildContext context)=> ThemeData(
    brightness: Brightness.dark,
  );
  //other colors
  static Color Bulish = Color(0xfff5f5f5);// Correct version
  static Color CreamColor = Color(0xff403b58);


}