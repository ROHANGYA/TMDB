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
          style:
              ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
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
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                  MyColors.crayolaGold.withOpacity(0.2)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                  side: const BorderSide(color: MyColors.crayolaGold))),
              surfaceTintColor:
                  const MaterialStatePropertyAll(MyColors.crayolaGold),
              foregroundColor:
                  const MaterialStatePropertyAll(MyColors.crayolaGold))),
      popupMenuTheme: PopupMenuThemeData(
          color: MyColors.charcoal,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return GoogleFonts.poppins(
                  fontSize: 14,
                  color: MyColors.crayolaGold,
                  fontWeight: FontWeight.bold);
            } else {
              return GoogleFonts.poppins(fontSize: 14, color: Colors.white);
            }
          }),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          position: PopupMenuPosition.under),
      radioTheme:
          RadioThemeData(fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return MyColors.crayolaGold;
        } else {
          return Colors.white;
        }
      })),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: MaterialStatePropertyAll(MyColors.crayolaGold.withOpacity(0.2)), textStyle: MaterialStatePropertyAll(GoogleFonts.poppins(fontSize: 14, color: MyColors.crayolaGold, fontWeight: FontWeight.normal)), surfaceTintColor: const MaterialStatePropertyAll(MyColors.crayolaGold), foregroundColor: const MaterialStatePropertyAll(MyColors.crayolaGold))),
      splashColor: MyColors.crayolaGold,
      dialogTheme: DialogTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), backgroundColor: MyColors.charcoal, titleTextStyle: GoogleFonts.poppins(fontSize: 23, color: Colors.white), contentTextStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
      snackBarTheme: SnackBarThemeData(dismissDirection: DismissDirection.down, backgroundColor: MyColors.crayolaGold, contentTextStyle: GoogleFonts.poppins(fontSize: 14, color: MyColors.darkBlue), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), behavior: SnackBarBehavior.floating));

  /// ####################################### DARK THEME
  static final mainDarkTheme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: MyColors.crayolaGold,
      ),
      fontFamily: GoogleFonts.roboto().fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      textTheme: TextTheme(
          displayLarge:
              GoogleFonts.poppins(fontSize: 23, color: MyColors.darkBlue),
          displayMedium:
              GoogleFonts.poppins(fontSize: 19, color: MyColors.darkBlue),
          displaySmall:
              GoogleFonts.poppins(fontSize: 14, color: MyColors.darkBlue)),
      searchBarTheme: SearchBarThemeData(
          backgroundColor:
              MaterialStatePropertyAll(MyColors.charcoal.withOpacity(0.3)),
          elevation: const MaterialStatePropertyAll(0),
          textStyle: MaterialStatePropertyAll(GoogleFonts.poppins(
              fontSize: 13, color: MyColors.darkBlue, wordSpacing: 0)),
          hintStyle: MaterialStatePropertyAll(GoogleFonts.poppins(
              fontSize: 13,
              color: MyColors.darkBlue.withOpacity(0.4),
              wordSpacing: 0))),
      scrollbarTheme: const ScrollbarThemeData(radius: Radius.circular(20)),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(MyColors.darkBlue))),
      iconTheme: const IconThemeData(color: MyColors.darkBlue),
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
      scaffoldBackgroundColor: Colors.white,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                  MyColors.crayolaGold.withOpacity(0.2)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                  side: const BorderSide(color: MyColors.crayolaGold))),
              surfaceTintColor:
                  const MaterialStatePropertyAll(MyColors.crayolaGold),
              foregroundColor:
                  const MaterialStatePropertyAll(MyColors.crayolaGold))),
      popupMenuTheme: PopupMenuThemeData(
          color: MyColors.charcoal,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return GoogleFonts.poppins(
                  fontSize: 14,
                  color: MyColors.crayolaGold,
                  fontWeight: FontWeight.bold);
            } else {
              return GoogleFonts.poppins(
                  fontSize: 14, color: MyColors.darkBlue);
            }
          }),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          position: PopupMenuPosition.under),
      radioTheme:
          RadioThemeData(fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return MyColors.crayolaGold;
        } else {
          return MyColors.darkBlue;
        }
      })),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: MaterialStatePropertyAll(MyColors.crayolaGold.withOpacity(0.2)), textStyle: MaterialStatePropertyAll(GoogleFonts.poppins(fontSize: 14, color: MyColors.crayolaGold, fontWeight: FontWeight.normal)), surfaceTintColor: const MaterialStatePropertyAll(MyColors.crayolaGold), foregroundColor: const MaterialStatePropertyAll(MyColors.crayolaGold))),
      splashColor: MyColors.crayolaGold,
      dialogTheme: DialogTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), backgroundColor: MyColors.charcoal, titleTextStyle: GoogleFonts.poppins(fontSize: 23, color: MyColors.darkBlue), contentTextStyle: GoogleFonts.poppins(fontSize: 14, color: MyColors.darkBlue)),
      snackBarTheme: SnackBarThemeData(dismissDirection: DismissDirection.down, backgroundColor: MyColors.charcoal, contentTextStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.white), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), behavior: SnackBarBehavior.floating));
}
