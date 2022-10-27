import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 255, 60, 95),
    background: Color.fromRGBO(30, 38, 48, 1),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 23, 33, 45),

  // primaryColor: Color.fromRGBO(30, 38, 48, 1),
  // backgroundColor: Color.fromARGB(255, 255, 60, 95),
  // colorScheme: ColorScheme(
  //   brightness: Brightness.dark,
  //   primary:
  // ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  // textTheme: TextTheme().apply(
  //   bodyColor: Color.fromARGB(255, 231, 233, 236),
  //   displayColor: Color.fromARGB(255, 231, 233, 236),
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: Color.fromARGB(255, 255, 60, 95),
  //   ),
  // ),
  appBarTheme: innerPageAppBarTheme,
  outlinedButtonTheme: transparentWhiteOutlinedButtonTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(),
);

OutlinedButtonThemeData transparentWhiteOutlinedButtonTheme =
    OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 231, 233, 236),
    side: const BorderSide(
      width: 3,
      color: Color.fromARGB(255, 174, 174, 174),
    ),
  ),
);

AppBarTheme innerPageAppBarTheme = AppBarTheme(
  // backgroundColor: Colors.transparent,
  backgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
);
