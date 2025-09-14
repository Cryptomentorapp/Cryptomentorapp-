import 'package:flutter/material.dart';
class CMTheme {
  static const Color gold = Color(0xFFD4AF37);
  static const Color darkBg = Color(0xFF12100E);
  static const Color darkCard = Color(0xFF1E1A16);
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBg,
      appBarTheme: const AppBarTheme(backgroundColor: darkBg,elevation: 0),
      cardColor: darkCard,
      colorScheme: const ColorScheme.dark(primary: gold, secondary: gold),
    );
  }
}
