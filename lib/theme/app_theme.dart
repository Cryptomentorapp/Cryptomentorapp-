import 'package:flutter/material.dart';
class CMTheme {
  static const Color primary = Color(0xFF00D1B2);
  static const Color bg = Color(0xFF0A0E12);
  static const Color surface = Color(0xFF121820);
  static const Color text = Color(0xFFE8F1F2);
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primary, surface: surface, background: bg, onPrimary: Colors.black, onSurface: text
    ),
    scaffoldBackgroundColor: bg,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: text),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: text),
      bodyMedium: TextStyle(fontSize: 14, color: text),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: text, centerTitle: true),
    cardTheme: CardTheme(color: surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
    inputDecorationTheme: InputDecorationTheme(filled: true, fillColor: Color(0xFF0F141B), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(backgroundColor: primary, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12))),
  );
}