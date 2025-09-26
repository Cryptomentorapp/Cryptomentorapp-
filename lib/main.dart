import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/dashboard.dart';
import 'pages/market.dart';
import 'pages/news.dart';
import 'pages/token_scanner.dart';
import 'pages/whales.dart';
import 'pages/cmt_hub.dart';
import 'pages/signals.dart';
import 'pages/admin_panel.dart';
import 'pages/settings.dart';

void main()=>runApp(const CMApp());

class CMApp extends StatelessWidget{
  const CMApp({super.key});
  @override
  Widget build(BuildContext c)=>MaterialApp(
    title:'Cryptomentor',
    theme: CMTheme.dark,
    home: const _Shell(),
  );
}

class _Shell extends StatefulWidget{ const _Shell({super.key}); @override State<_Shell> createState()=>_S(); }
class _S extends State<_Shell>{
  int idx=0;
  final screens=[ const DashboardPage(), const MarketPage(), const NewsPage(), const TokenScannerPage(), const WhalesPage(), const CMTHubPage(), const SignalsPage(), const AdminPanelPage(), const SettingsPage() ];
  final titles=['Dashboard','Market','News','Scanner','Whales','CMT Hub','Signals','Admin','Settings'];
  @override Widget build(BuildContext c)=>Scaffold(
    appBar: AppBar(title: Text(titles[idx])),
    body: screens[idx],
    bottomNavigationBar: NavigationBar(selectedIndex: idx, onDestinationSelected:(i)=>setState(()=>idx=i), destinations: const [
      NavigationDestination(icon: Icon(Icons.dashboard_outlined), label:'Home'),
      NavigationDestination(icon: Icon(Icons.show_chart), label:'Market'),
      NavigationDestination(icon: Icon(Icons.article_outlined), label:'News'),
      NavigationDestination(icon: Icon(Icons.search), label:'Scanner'),
      NavigationDestination(icon: Icon(Icons.paid_outlined), label:'Whales'),
      NavigationDestination(icon: Icon(Icons.token), label:'CMT Hub'),
      NavigationDestination(icon: Icon(Icons.auto_graph_outlined), label:'Signals'),
      NavigationDestination(icon: Icon(Icons.admin_panel_settings_outlined), label:'Admin'),
      NavigationDestination(icon: Icon(Icons.settings_outlined), label:'Settings'),
    ]),
  );
}