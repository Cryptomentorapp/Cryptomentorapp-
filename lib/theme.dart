import 'package:flutter/material.dart';
class CMTheme {
  static ThemeData light() {
    final base = ThemeData(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00D1B2), brightness: Brightness.light),
      cardTheme: const CardTheme(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
    );
  }
  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF0B1220),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00D1B2), brightness: Brightness.dark),
      cardTheme: const CardTheme(
        color: Color(0xFF0F172A),
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      textTheme: base.textTheme.apply(bodyColor: const Color(0xFFCFD8E3), displayColor: const Color(0xFFCFD8E3)),
    );
  }
}