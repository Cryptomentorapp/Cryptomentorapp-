
import 'package:flutter/material.dart';
class CmtTheme{
  static const bg=Color(0xFF0B0F14), panel=Color(0xFF0E1520), card=Color(0xFF101826);
  static const text=Color(0xFFE7EEF7), sub=Color(0xFF9FB0C3), gold=Color(0xFFF6D465);
  static ThemeData theme=ThemeData(
    useMaterial3:true, brightness:Brightness.dark, scaffoldBackgroundColor:bg,
    colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.dark).copyWith(
      background:bg, surface:panel, primary:gold, secondary:gold),
    appBarTheme: const AppBarTheme(backgroundColor:bg, foregroundColor:text, elevation:0),
  );
  static BoxDecoration tile()=>BoxDecoration(color:card, borderRadius:BorderRadius.circular(18));
}
