import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'state.dart';
import 'pages/dashboard.dart';
import 'pages/market.dart';
import 'pages/news.dart';
import 'pages/token_scanner.dart';
import 'pages/whales.dart';
import 'pages/admin_panel.dart';
import 'pages/settings.dart';
import 'pages/pricing.dart';

void main() { runApp(const CMApp()); }

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>AppState(),
      child: MaterialApp(title: 'Cryptomentor', theme: CMTheme.dark(), home: const HomeShell()));
  }
}

class HomeShell extends StatefulWidget { const HomeShell({super.key}); @override State<HomeShell> createState()=>_HomeShellState(); }
class _HomeShellState extends State<HomeShell>{
  int idx=0;
  final pages=[ const DashboardPage(), const MarketPage(), const NewsPage(), const TokenScannerPage(), const WhalesPage(), const AdminPanelPage(), const SettingsPage(), const PricingPage() ];
  final titles=['Dashboard','Market','News','Scanner','Whales','Admin','Settings','Pricing'];
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(titles[idx])),
      body: pages[idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        onDestinationSelected: (i)=>setState(()=>idx=i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label:'Home'),
          NavigationDestination(icon: Icon(Icons.show_chart), label:'Market'),
          NavigationDestination(icon: Icon(Icons.article_outlined), label:'News'),
          NavigationDestination(icon: Icon(Icons.search), label:'Scanner'),
          NavigationDestination(icon: Icon(Icons.paid_outlined), label:'Whales'),
          NavigationDestination(icon: Icon(Icons.admin_panel_settings_outlined), label:'Admin'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label:'Settings'),
          NavigationDestination(icon: Icon(Icons.workspace_premium_outlined), label:'Pricing'),
        ],
      ),
    );
  }
}