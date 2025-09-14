import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'trading_signals.dart';
import 'token_scanner.dart';
import 'research_hub.dart';
import 'news_list.dart';
import 'coming_soon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <_Module>[
      _Module('Trading\nSignals', Icons.show_chart, () => const SignalsPage()),
      _Module('Token\nScanner', Icons.shield, () => const TokenScannerPage()),
      _Module('Research\nHub', Icons.auto_awesome, () => const ResearchHubPage()),
      _Module('News', Icons.article, () => const NewsListPage()),
      _Module('Academy', Icons.school, () => const ComingSoonPage(title: 'Academy')),
      _Module('Whales', Icons.sailing, () => const ComingSoonPage(title: 'Whales Tracker')),
      _Module('CMT Info', Icons.info, () => const ComingSoonPage(title: 'CMT Info')),
      _Module('Admin', Icons.admin_panel_settings, () => const ComingSoonPage(title: 'Admin Panel')),
      _Module('CMT AI', Icons.chat_bubble, () => const ComingSoonPage(title: 'CMT AI')),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor – Modules')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: modules.length,
          itemBuilder: (context, i) => _ModuleCard(mod: modules[i]),
        ),
      ),
    );
  }
}

class _Module {
  final String title;
  final IconData icon;
  final Widget Function() builder;
  _Module(this.title, this.icon, this.builder);
}

class _ModuleCard extends StatelessWidget {
  final _Module mod;
  const _ModuleCard({required this.mod});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => mod.builder())),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(mod.icon, size: 36, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(mod.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
