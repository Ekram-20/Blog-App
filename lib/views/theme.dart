import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const kPrimaryColor = Color.fromRGBO(26, 26, 26, 1);

  static ThemeData customTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      primary: Colors.black,
      secondary: Colors.white,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light, 
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.grey[100],
    // ),
    textTheme: GoogleFonts.rubikTextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: kPrimaryColor,
        fontSize: 16.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: Color.fromARGB(200, 225, 225, 225),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
