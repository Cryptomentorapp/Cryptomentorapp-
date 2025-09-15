import 'package:flutter/material.dart';

enum CmtThemeMode { dark, light, goldLight }

class ThemeController extends ChangeNotifier {
  CmtThemeMode _mode = CmtThemeMode.dark;
  CmtThemeMode get mode => _mode;
  ThemeData get theme {
    switch (_mode) {
      case CmtThemeMode.light: return CmtThemes.light;
      case CmtThemeMode.goldLight: return CmtThemes.goldLight;
      case CmtThemeMode.dark: default: return CmtThemes.dark;
    }
  }
  void set(CmtThemeMode m) { _mode = m; notifyListeners(); }
}

class CmtColors {
  static const bg = Color(0xFF15100C);
  static const card = Color(0xFF211A13);
  static const surface = Color(0xFF2A221B);
  static const gold = Color(0xFFDAB56B);
  static const text = Color(0xFFEDE6DA);

  static const lightBg = Color(0xFFF7F5F1);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF2B241B);

  static const goldBg = Color(0xFFFFFBF2);
  static const goldCard = Color(0xFFFFF4DA);
  static const goldInk = Color(0xFF3C3120);
}

class CmtThemes {
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CmtColors.bg,
    cardColor: CmtColors.card,
    colorScheme: const ColorScheme.dark(
      primary: CmtColors.gold,
      secondary: CmtColors.gold,
      surface: CmtColors.surface,
      onSurface: CmtColors.text,
    ),
  );

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: CmtColors.lightBg,
    cardColor: CmtColors.lightCard,
    colorScheme: const ColorScheme.light(
      primary: CmtColors.gold,
      secondary: CmtColors.gold,
      surface: CmtColors.lightCard,
      onSurface: CmtColors.lightText,
    ),
  );

  static final goldLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: CmtColors.goldBg,
    cardColor: CmtColors.goldCard,
    colorScheme: const ColorScheme.light(
      primary: CmtColors.gold,
      secondary: CmtColors.gold,
      surface: CmtColors.goldCard,
      onSurface: CmtColors.goldInk,
    ),
  );
}
