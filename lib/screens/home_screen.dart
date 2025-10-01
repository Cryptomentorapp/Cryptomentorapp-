import 'package:flutter/material.dart';
import '../widgets/module_grid.dart';
import '../widgets/cm_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 8),
          ModuleGrid(),
          SizedBox(height: 16),
          _OverviewRow(),
        ],
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}

class _OverviewRow extends StatelessWidget {
  const _OverviewRow();
  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Expanded(child: CMCard(title: 'Total MCap', value: '—')),
      SizedBox(width: 12),
      Expanded(child: CMCard(title: 'BTC DOM', value: '—')),
      SizedBox(width: 12),
      Expanded(child: CMCard(title: 'Fear & Greed', value: '50 Neutral')),
    ]);
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.forum), label: 'Community'),
        NavigationDestination(icon: Icon(Icons.event), label: 'Events'),
        NavigationDestination(icon: Icon(Icons.person), label: 'User'),
      ],
    );
  }
}
