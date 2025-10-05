import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: const Color(0xFFFFD700), // gold
      secondary: const Color(0xFF00D1FF), // accent
    ),
    scaffoldBackgroundColor: const Color(0xFF0B0B0F),
    cardColor: const Color(0xFF12121A),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0B0B0F),
      elevation: 0,
    ),
  );
}
