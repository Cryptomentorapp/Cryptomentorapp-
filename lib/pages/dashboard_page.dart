import 'package:flutter/material.dart';
import '../widgets/module_grid.dart';
import '../widgets/metric_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Modules', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ModuleGrid(items: [
            ModuleItem(title: 'Market', icon: Icons.show_chart, onTap: () {}),
            ModuleItem(title: 'News', icon: Icons.article, onTap: () {}),
          ]),
          const SizedBox(height: 24),
          const Text('Market Overview'),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MetricTile(title: 'Total MCap', value: '—'),
              MetricTile(title: 'BTC DOM', value: '—'),
              MetricTile(title: 'Fear & Greed', value: '50 Neutral'),
            ],
          )
        ],
      ),
    );
  }
}
