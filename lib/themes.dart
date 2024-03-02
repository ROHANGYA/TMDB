import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/constants.dart';

abstract class Themes {
  static final mainLightTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MyColors.crayolaGold,
    ),
    fontFamily: GoogleFonts.roboto().fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
        displayMedium: GoogleFonts.poppins(fontSize: 19, color: Colors.white),
        displaySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
    searchBarTheme: SearchBarThemeData(
        backgroundColor:
            MaterialStatePropertyAll(MyColors.charcoal.withOpacity(0.3)),
        elevation: const MaterialStatePropertyAll(0),
        textStyle: MaterialStatePropertyAll(GoogleFonts.poppins(
            fontSize: 13, color: Colors.white, wordSpacing: 0)),
        hintStyle: MaterialStatePropertyAll(GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.white.withOpacity(0.4),
            wordSpacing: 0))),
    scrollbarTheme: const ScrollbarThemeData(radius: Radius.circular(20)),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.charcoal),
    navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: Colors.transparent,
        backgroundColor: MyColors.charcoal,
        indicatorColor: MyColors.crayolaGold,
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: MyColors.charcoal);
          } else {
            return const IconThemeData(color: Colors.white);
          }
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                wordSpacing: 0);
          } else {
            return GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.normal,
                wordSpacing: 0);
          }
        })),
    useMaterial3: true,
    scaffoldBackgroundColor: MyColors.darkBlue,
  );

  static final mainDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
