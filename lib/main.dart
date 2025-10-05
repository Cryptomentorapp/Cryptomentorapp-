import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CryptomentorApp());
}

class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const AppRouter(),
    );
  }
}
