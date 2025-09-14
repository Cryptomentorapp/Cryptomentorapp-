// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
    // 👇 CHỈ CẦN ĐỔI CardTheme -> CardThemeData
    cardTheme: CardThemeData(
      color: const Color(0xFF272017),
      elevation: 0,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    // ... các theme khác giữ nguyên
  );
}
