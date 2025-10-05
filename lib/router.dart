import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/signals_screen.dart';
import 'screens/dex_screen.dart';
import 'screens/news_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/settings_screen.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  int _index = 0;

  final _screens = const [
    DashboardScreen(),
    SignalsScreen(),
    DexScreen(),
    NewsScreen(),
    AiChatScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.trending_up), label: 'Signals'),
          NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'DEX'),
          NavigationDestination(icon: Icon(Icons.article_outlined), label: 'News'),
          NavigationDestination(icon: Icon(Icons.smart_toy_outlined), label: 'AI'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        onDestinationSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}
