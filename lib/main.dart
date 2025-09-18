import 'package:flutter/material.dart';
import 'theme/styles.dart';
import 'screens/home.dart';
import 'screens/market.dart';
import 'screens/signals.dart';
import 'screens/cmt_hub.dart';
import 'screens/launchpad.dart';
import 'screens/whales.dart';
import 'screens/research.dart';
import 'screens/academy.dart';
import 'screens/community.dart';
import 'screens/admin.dart';
import 'screens/wallet.dart';

void main() => runApp(const CMApp());

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Cryptomentor', theme: buildAppTheme(), home: const RootShell());
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override State<RootShell> createState() => _RootShellState();
}
class _RootShellState extends State<RootShell> {
  int idx = 0;
  final pages = const [HomeScreen(), MarketScreen(), SignalsScreen(), CmtHubScreen(), LaunchpadScreen(), WhalesScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: idx, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx, onDestinationSelected: (i)=> setState(()=> idx=i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.show_chart_outlined), label: 'Market'),
          NavigationDestination(icon: Icon(Icons.bolt_outlined), label: 'Signals'),
          NavigationDestination(icon: Icon(Icons.info_outline), label: 'CMT'),
          NavigationDestination(icon: Icon(Icons.rocket_launch_outlined), label: 'Launchpad'),
          NavigationDestination(icon: Icon(Icons.ssid_chart_outlined), label: 'Whales'),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(child: ListView(children: const [
          ListTile(title: Text('Cryptomentor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800))),
          Divider(),
          ListTile(leading: Icon(Icons.account_balance_wallet_outlined), title: Text('Wallet')),
          ListTile(leading: Icon(Icons.analytics_outlined), title: Text('Research')),
          ListTile(leading: Icon(Icons.menu_book_outlined), title: Text('Academy')),
          ListTile(leading: Icon(Icons.group_outlined), title: Text('Community')),
          ListTile(leading: Icon(Icons.admin_panel_settings_outlined), title: Text('Admin')),
        ])),
      ),
    );
  }
}