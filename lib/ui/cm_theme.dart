import 'package:flutter/material.dart';
class CMTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(primary: Color(0xFFF6D465)),
    scaffoldBackgroundColor: const Color(0xFF0E1117),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    listTileTheme: const ListTileThemeData(dense: true),
  );
}
