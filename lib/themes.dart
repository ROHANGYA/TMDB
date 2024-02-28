import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Themes {
  static final mainLightTheme = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
        displayMedium: GoogleFonts.poppins(fontSize: 19, color: Colors.white),
        displaySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
    searchBarTheme: const SearchBarThemeData(
        backgroundColor: MaterialStatePropertyAll(Colors.grey),
        surfaceTintColor: MaterialStatePropertyAll(Colors.grey),
        elevation: MaterialStatePropertyAll(0)),
    scrollbarTheme: const ScrollbarThemeData(radius: Radius.circular(20)),
    useMaterial3: true,
  );

  static final mainDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
