import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xffff9b2e),
    primary: const Color(0xffff9b2e),
    secondary: const Color(0xff171717),
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: const Color(0xffff9b2e).withOpacity(0.25),
  ),
);
