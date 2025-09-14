import 'package:flutter/material.dart';
class AppTheme {
  static const Color navy = Color(0xFF0E1726);
  static const Color panel = Color(0xFF131D2E);
  static const Color card = Color(0xFF141C2B);
  static const Color gold = Color(0xFFD9B354);
  static const Color green = Color(0xFF2ED47A);
  static const Color red = Color(0xFFFF6B6B);
  static const Color textPrimary = Color(0xFFE7EEF7);
  static const Color textSecondary = Color(0xFF9DB1CC);
  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: navy,
      colorScheme: base.colorScheme.copyWith(
        primary: gold, secondary: gold, surface: panel, onSurface: textPrimary,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: textPrimary, displayColor: textPrimary,
      ),
      cardTheme: CardTheme(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        margin: const EdgeInsets.all(0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0E1726),
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: panel,
        indicatorColor: const Color(0xFF3B2C12),
        labelTextStyle: MaterialStatePropertyAll(
          TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
