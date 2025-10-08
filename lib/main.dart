import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'screens/home_screen.dart';

void main() => runApp(const CryptomentorApp());

class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptomentor',
      theme: cryptomentorTheme(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
