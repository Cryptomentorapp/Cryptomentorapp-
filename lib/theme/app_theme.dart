import 'package:flutter/material.dart';
ThemeData buildAppTheme() {
  const bg = Color(0xFF0E1116);
  const card = Color(0xFF151923);
  const gold = Color(0xFFE2C268);
  const text = Color(0xFFE8EEF5);
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: bg,
    colorScheme: const ColorScheme.dark(primary: gold, secondary: gold, surface: card, onSurface: text),
    cardTheme: const CardTheme(color: card, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))), elevation: 0, margin: EdgeInsets.zero),
    appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: text, elevation: 0, titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
  );
}
