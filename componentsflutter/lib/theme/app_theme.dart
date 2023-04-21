import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.orange;
  static const Color primaryBtns = Colors.deepOrange;
  static const Color primaryInputs = Color.fromARGB(255, 229, 56, 3);
  static const Color primaryInputsFocus = Color.fromARGB(255, 247, 134, 99);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.deepOrange)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBtns,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primaryInputs),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryInputs),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryInputsFocus),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))));
}
