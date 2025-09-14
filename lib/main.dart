
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/signals/signals_list_screen.dart';
import 'screens/scanner/scanner_screen.dart';
import 'screens/research/research_list_screen.dart';
import 'screens/settings_screen.dart';
void main() => runApp(const CryptomentorApp());
class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});
  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFB08A3B), brightness: Brightness.dark),
      scaffoldBackgroundColor: Color(0xFF1C150E),
      useMaterial3: true,
    );
    return MaterialApp(
      title: 'Cryptomentor',
      theme: baseTheme.copyWith(
        cardTheme: const CardTheme(color: Color(0xFF2A221A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)))),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      ),
      home: const RootTabs(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class RootTabs extends StatefulWidget { const RootTabs({super.key}); @override State<RootTabs> createState() => _RootTabsState(); }
class _RootTabsState extends State<RootTabs> {
  int _index = 0;
  final _screens = const [ HomeScreen(), SignalsListScreen(), ScannerScreen(), ResearchListScreen(), SettingsScreen(), ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.show_chart_outlined), selectedIcon: Icon(Icons.show_chart), label: 'Signals'),
          NavigationDestination(icon: Icon(Icons.shield_outlined), selectedIcon: Icon(Icons.shield), label: 'Scanner'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'Research'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
