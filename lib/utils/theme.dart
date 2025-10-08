import 'package:flutter/material.dart';

const Color kGold = Color(0xFFFFC107);
const Color kBgDark = Color(0xFF0E0E0E);

ThemeData cryptomentorTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBgDark,
    colorScheme: const ColorScheme.dark(primary: kGold, secondary: kGold),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black, foregroundColor: kGold, elevation: 0),
    cardTheme: CardTheme(color: const Color(0xFF161616), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14)))),
    listTileTheme: const ListTileThemeData(iconColor: kGold),
  );
}

BoxDecoration goldGradient() => const BoxDecoration(
  gradient: LinearGradient(colors: [Color(0xFF111111), Color(0xFF1D1A00)], begin: Alignment.topLeft, end: Alignment.bottomRight),
);
