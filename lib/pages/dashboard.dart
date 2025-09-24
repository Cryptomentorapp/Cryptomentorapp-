import 'package:flutter/material.dart';
import '../widgets/cm_card.dart';
class DashboardPage extends StatelessWidget { const DashboardPage({super.key});
  @override Widget build(BuildContext context)=>ListView(padding: const EdgeInsets.all(16), children: const [
    CMCard(child: Text('Welcome to Cryptomentor — demo build using free APIs.')),
    CMCard(child: Text('Use the bottom tabs to view Market, News, Scanner, Whales.')),
  ]);
}