import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.black,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.black, width: 1.5),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: const TextStyle(color: Colors.white),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      deleteIconColor: Colors.black,
      disabledColor: Colors.white,
      selectedColor: Colors.black,
      secondarySelectedColor: Colors.black,
      labelStyle: const TextStyle(color: Colors.black),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      side: const BorderSide(color: Colors.black, width: 1.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
      linearTrackColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      prefixIconColor: Colors.black,
      suffixIconColor: Colors.black,
      counterStyle: const TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.black, width: 1.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.black, width: 1.4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.black, width: 1.4),
      ),
    ),
  );
}
