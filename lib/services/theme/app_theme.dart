import 'package:flutter/material.dart';

import '../../common/constant.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    )),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      onPrimary: Colors.black54,
      primary: Colors.white,
      // secondary: secondaryColor,
      background: Colors.white70,
      secondary: Colors.black,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.cyan),
  );

  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black38,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    )),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      primary: Colors.black,
      secondary: Colors.black87,
      background: Colors.black,
      onPrimary: Colors.white54,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.deepPurple),
  );

  static get lightTheme => light;
  static get darkTheme => dark;
}
