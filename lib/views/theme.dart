import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData customTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color.fromRGBO(21, 52, 72, 1),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(19, 47, 64, 1),
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.grey[100],
    // ),
    // textTheme: GoogleFonts.montserratTextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color.fromRGBO(19, 47, 64, 0.7),
        fontSize: 16.0,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(19, 47, 64, 0.7),
        ),
        // borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(19, 47, 64, 1),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(19, 47, 64, 1),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
