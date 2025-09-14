import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CryptomentorApp());
}

class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptomentor',
      theme: AppTheme.dark, // ✅ không có ()
      home: const HomeScreen(),
    );
  }
}
