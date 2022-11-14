import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahakari/common/constant.dart';

class Themes {
  // ------------------ LIGHT THEME ------------------

  static final ThemeData _lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    primaryColorDark: Colors.black87,
    scaffoldBackgroundColor: lightBackgroundColor,
    // ------------------ Elevated Button THEME -----------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        disabledBackgroundColor: Colors.grey,
        elevation: 0,
        padding: EdgeInsets.all(10),
        foregroundColor: Colors.black,
        // size: Size(_screenWidth * 0.9, 50),
      ),
    ),

    // -------Button Theme-------
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),

    //-------Color Scheme-------
    colorScheme: const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      onPrimary: onPrimaryLight,
      primary: Colors.white,
      // secondary: secondaryColor,
      background: Colors.white54,
      secondary: secondaryColor,
    ),

    //-------Botttom AppBar Theme-------
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.cyan),

    //-------Input Decoration Theme-------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hoverColor: Colors.white.withOpacity(0.7),
      labelStyle: TextStyle(color: Colors.black54),
      floatingLabelStyle: TextStyle(color: Colors.black54),
      focusColor: Colors.black54,
      alignLabelWithHint: true,
      prefixIconColor: Colors.black54,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      // prefixStyle: ,
    ),
    //-------Text Selection Theme-------
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black54,
      selectionColor: Colors.lightBlueAccent,
      selectionHandleColor: Colors.black87,
    ),
    //-------AppBar Theme-------
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    iconTheme: IconThemeData(color: Colors.black87),
    //------Card Theme------
    cardTheme: CardTheme(
      elevation: 2,
      color: lightBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  // ------------------ DARK THEME ------------------

  static final ThemeData _darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    primaryColorDark: Colors.white,
    scaffoldBackgroundColor: darkBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        disabledBackgroundColor: Colors.grey,
        elevation: 0,
        padding: EdgeInsets.all(10),
        // minimumSize: Size(_screenWidth * 0.9, 50),
        // foregroundColor: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      primary: Colors.black,
      secondary: secondaryColor,
      background: Colors.black,
      onPrimary: onPrimaryDark,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.deepPurple),
    // textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white70),
      floatingLabelStyle: TextStyle(color: Colors.white70),
      focusColor: Colors.white70,
      alignLabelWithHint: true,
      prefixIconColor: Colors.white54,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.solid, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.lightBlueAccent,
      selectionHandleColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  // ------------------ TEXT THEME ------------------
  static TextTheme _textTheme() => TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        headlineMedium: TextStyle(
          fontSize: 24.0,
          // fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.lato().fontFamily,

          // color: Theme.of(context).primaryColorDark,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.0,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          fontFamily: GoogleFonts.lato().fontFamily,
          // color: Theme.of(context).primaryColorDark,
        ),
        bodySmall: TextStyle(
          fontSize: 12.0,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        titleLarge: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
      );

  // ------------------ GET THEME ------------------
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
  static TextTheme get textTheme => _textTheme();
}
