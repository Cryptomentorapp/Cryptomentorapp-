import 'package:flutter/material.dart';

class AppTheme {
  // Common colors
  static const Color gold = Color(0xFFD8B46A);
  static const Color textPrimary = Color(0xFFE6E0D6);
  static const Color textSecondary = Color(0xFFB3AA9C);
  static const Color card = Color(0xFF2B241C);
  static const Color surface = Color(0xFF1D1913);
  static const Color background = Color(0xFF16130E);

  // Dark theme
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    cardColor: card,
    colorScheme: const ColorScheme.dark(
      primary: gold,
      surface: surface,
      onSurface: textPrimary,
      secondary: gold,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: textPrimary),
      bodySmall: TextStyle(color: textSecondary),
    ),
  );
}
