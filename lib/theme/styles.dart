import 'package:flutter/material.dart';

class CMColors {
  static const bg = Color(0xFF1E1610);
  static const surface = Color(0xFF251B14);
  static const surface2 = Color(0xFF2B2019);
  static const text = Color(0xFFE7D9C4);
  static const textDim = Color(0xFFC9B9A3);
  static const gold = Color(0xFFE9C06A);
  static const red = Color(0xFFE85D5D);
  static const green = Color(0xFF47C77C);
  static const blue = Color(0xFF5AA7FF);
}

ThemeData buildAppTheme() {
  final cardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(22));
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CMColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: CMColors.gold,
      surface: CMColors.surface,
      secondary: CMColors.surface2,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CMColors.bg,
      foregroundColor: CMColors.text,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: CMColors.text),
    ),
    cardTheme: CardTheme(
      color: CMColors.surface,
      shape: cardShape,
      elevation: 4,
      shadowColor: Colors.black54,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: CMColors.text, fontSize: 14),
      bodySmall: TextStyle(color: CMColors.textDim, fontSize: 12),
      titleMedium: TextStyle(color: CMColors.text, fontSize: 16, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(color: CMColors.text, fontSize: 20, fontWeight: FontWeight.w800),
    ),
    fontFamily: 'Inter',
  );
}

class Insets {
  static const screen = EdgeInsets.symmetric(horizontal: 12, vertical: 12);
  static const card = EdgeInsets.all(16);
}