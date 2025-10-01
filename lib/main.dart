import 'package:flutter/material.dart';
import 'cm_theme.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(const CMApp());
}

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptomentor',
      debugShowCheckedModeBanner: false,
      theme: CMTheme.dark,
      home: const DashboardPage(),
    );
  }
}
