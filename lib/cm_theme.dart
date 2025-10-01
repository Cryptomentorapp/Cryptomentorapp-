import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CMTheme {
  static const gold = Color(0xFFE4C06B);
  static const bg = Color(0xFF0F1218);
  static const text = Color(0xFFE9EDF5);

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: bg,
    colorScheme: const ColorScheme.dark(
      primary: gold,
      surface: Color(0xFF141922),
      onSurface: text,
    ),
    textTheme: GoogleFonts.interTextTheme(),
  );
}
