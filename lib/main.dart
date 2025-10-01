import 'dart:convert';
import 'package:flutter/material.dart';
import 'ui/cm_theme.dart';
import 'pages/home.dart';
import 'pages/market.dart';
import 'pages/news.dart';
import 'pages/token_scanner.dart';
import 'pages/whales.dart';
import 'pages/dex.dart';
import 'pages/signals.dart';
import 'pages/academy.dart';
import 'pages/cmt_hub.dart';
import 'pages/launchpad.dart';
import 'pages/community.dart';
import 'pages/events.dart';
import 'pages/user.dart';

void main() => runApp(const CMApp());

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptomentor',
      debugShowCheckedModeBanner: false,
      theme: CMTheme.dark,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/market': (_) => const MarketPage(),
        '/news': (_) => const NewsPage(),
        '/scanner': (_) => const TokenScannerPage(),
        '/whales': (_) => const WhalesPage(),
        '/dex': (_) => const DexPage(),
        '/signals': (_) => const SignalsPage(),
        '/academy': (_) => const AcademyPage(),
        '/cmt': (_) => const CMTHubPage(),
        '/launchpad': (_) => const LaunchpadPage(),
        '/community': (_) => const CommunityPage(),
        '/events': (_) => const EventsPage(),
        '/user': (_) => const UserPage(),
      },
    );
  }
}
