
import 'package:flutter/material.dart';

const Color kBg = Color(0xFF0C0E13);
const Color kCard = Color(0xFF121521);
const Color kGold = Color(0xFFF6C86E);

ThemeData buildAppTheme(){
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: kBg,
    cardColor: kCard,
    colorScheme: base.colorScheme.copyWith(primary: kGold, secondary: kGold),
    appBarTheme: const AppBarTheme(backgroundColor: kBg, elevation: 0),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: const Color(0xFF0F121C),
      side: const BorderSide(color: Colors.white10),
      labelStyle: const TextStyle(color: Colors.white),
    ),
  );
}
