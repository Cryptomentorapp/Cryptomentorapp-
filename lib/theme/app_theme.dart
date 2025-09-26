import 'package:flutter/material.dart';
class CMTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFF00D1B2),
    // cardTheme removed to avoid version mismatch; can style per-Card instead.
    appBarTheme: const AppBarTheme(centerTitle: true),
    scaffoldBackgroundColor: const Color(0xFF0B0F12),
  );
}