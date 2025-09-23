import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/app_state.dart';
import 'theme.dart';
import 'pages/dashboard.dart';
import 'pages/market.dart';
import 'pages/cmt_hub.dart';
import 'pages/signals.dart';
import 'pages/whale_tracker.dart';
import 'pages/dex_aggregator.dart';
import 'pages/wallet.dart';
import 'pages/token_scanner.dart';
import 'pages/news.dart';
import 'pages/admin_panel.dart';
import 'pages/pricing.dart';
import 'pages/settings.dart';

void main() { runApp(const CryptomentorApp()); }

class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Cryptomentor',
        theme: CMTheme.light(),
        darkTheme: CMTheme.dark(),
        home: const _Shell(),
      ),
    );
  }
}

class _Shell extends StatefulWidget { const _Shell({super.key}); @override State<_Shell> createState()=>_ShellState(); }
class _ShellState extends State<_Shell> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      const DashboardPage(), const MarketPage(), const CMTHubPage(), const SignalsPage(),
      const WhaleTrackerPage(), const DEXAggregatorPage(), const WalletPage(),
      const TokenScannerPage(), const NewsPage(), const PricingPage(), const AdminPanelPage(), const SettingsPage(),
    ];
    final labels = ['Dashboard','Market','CMT Hub','Signals','Whales','DEX','Wallet','Scanner','News','Pricing','Admin','Settings'];
    return Scaffold(
      appBar: AppBar(title: Text(labels[_index])),
      body: tabs[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: [
          const NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Home'),
          const NavigationDestination(icon: Icon(Icons.show_chart), label: 'Market'),
          const NavigationDestination(icon: Icon(Icons.token_outlined), label: 'CMT'),
          const NavigationDestination(icon: Icon(Icons.notifications_active_outlined), label: 'Signals'),
          const NavigationDestination(icon: Icon(Icons.search), label: 'Whales'),
          const NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'DEX'),
          const NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Wallet'),
          const NavigationDestination(icon: Icon(Icons.search_off_outlined), label: 'Scanner'),
          const NavigationDestination(icon: Icon(Icons.newspaper_outlined), label: 'News'),
          const NavigationDestination(icon: Icon(Icons.workspace_premium_outlined), label: 'Pricing'),
          const NavigationDestination(icon: Icon(Icons.admin_panel_settings_outlined), label: 'Admin'),
          const NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        onDestinationSelected: (i)=>setState(()=>_index=i),
      ),
    );
  }
}