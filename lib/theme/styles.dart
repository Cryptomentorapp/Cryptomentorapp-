import 'package:flutter/material.dart';
class CMColors {
  static const bg = Color(0xFF0B0F14);
  static const panel = Color(0xFF0E1520);
  static const card = Color(0xFF101826);
  static const text = Color(0xFFE7EEF7);
  static const gold = Color(0xFFF6D465);
  static const muted = Color(0xFF9FB0C3);
  static const divider = Color(0x1FFFFFFF);
  static const nav = Color(0xFF0C1118);
  static const green = Color(0xFF12CF84);
  static const red = Color(0xFFFF5C7C);
}
ThemeData buildAppTheme() => ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: CMColors.bg, appBarTheme: const AppBarTheme(backgroundColor: CMColors.bg));
class Insets { static const screen = EdgeInsets.symmetric(horizontal:12, vertical:12); static const card = EdgeInsets.all(12); }