import 'package:flutter/material.dart';
import 'screens/home.dart';
void main() => runApp(const CMApp());

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF17120D),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFDAB347),
        secondary: Color(0xFFAA8A3A),
        surface: Color(0xFF1E1711),
      ),
      cardColor: const Color(0xFF1E1711),
      useMaterial3: true,
    );
    return MaterialApp(
      title: 'Cryptomentor',
      theme: theme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
