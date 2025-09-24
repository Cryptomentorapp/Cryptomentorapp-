import 'package:flutter/material.dart';
import '../widgets/cm_card.dart';
class DashboardPage extends StatelessWidget { const DashboardPage({super.key});
  @override Widget build(BuildContext context)=>ListView(padding: const EdgeInsets.all(16), children: const [
    CMCard(child: Text('Cryptomentor — FULL build (free APIs).')),
    CMCard(child: Text('Tabs: Market, News, Scanner, Whales, Admin, Settings, Pricing.')),
  ]);
}