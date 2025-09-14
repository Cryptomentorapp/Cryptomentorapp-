import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/trading_signals_screen.dart';
import 'screens/token_scanner_screen.dart';
import 'screens/research_hub_screen.dart';
import 'screens/market_overview_screen.dart';
import 'screens/whales_tracker_screen.dart';
import 'screens/dex_screen.dart';
import 'screens/settings_screen.dart';

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
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const _RootShell(),
    );
  }
}

class _RootShell extends StatefulWidget {
  const _RootShell({super.key});

  @override
  State<_RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<_RootShell> {
  int _index = 0;

  final _pages = const [
    HomeScreen(),
    TradingSignalsScreen(),
    TokenScannerScreen(),
    ResearchHubScreen(),
    SettingsScreen(),
  ];

  final _titles = const [
    'Home',
    'Trading Signals',
    'Token Scanner',
    'Research Hub',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_index])),
      body: _pages[_index],
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
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: const [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cryptomentor', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('MVP • Buildable skeleton'),
                  ],
                ),
              ),
              _DrawerItem('Market Overview', Icons.dashboard_outlined, '/market'),
              _DrawerItem('Whales Tracker', Icons.sailing_outlined, '/whales'),
              _DrawerItem('DEX', Icons.swap_horiz_outlined, '/dex'),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;
  const _DrawerItem(this.label, this.icon, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          switch (route) {
            case '/market':
              return const MarketOverviewScreen();
            case '/whales':
              return const WhalesTrackerScreen();
            case '/dex':
              return const DexScreen();
            default:
              return const SizedBox.shrink();
          }
        }));
      },
    );
  }
}
