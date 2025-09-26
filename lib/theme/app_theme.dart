import 'package:flutter/material.dart';

class CMTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFF00D1B2),
    scaffoldBackgroundColor: const Color(0xFF0B0F12),
    cardTheme: const CardTheme(margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}