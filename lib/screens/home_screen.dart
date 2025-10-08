import '../services/knowledge.dart';  // ở đầu file
import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/header.dart';
import '../components/nav_bar.dart';
import '../utils/theme.dart';
import '../services/api.dart';
import 'module_signals.dart';
import 'module_scanner.dart';
import 'module_research.dart';
import 'module_nft.dart';
import 'module_cmt.dart';
import 'module_whales.dart';
import 'module_academy.dart';
import 'module_news.dart';
import 'market_overview.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  Map<String, dynamic>? global;
  List<dynamic> markets = [];
  List<dynamic> marketsMock = [];

List<Map<String, dynamic>> corpus = [];
@override
void initState() {
  super.initState();
  _loadMock(); _loadLive();
  KnowledgeService.loadCorpus().then((docs){ setState(()=> corpus = docs); });
}

  Future<void> _loadMock() async {
    final s = await rootBundle.loadString('assets/json/tokens.json');
    marketsMock = json.decode(s);
    if (mounted) setState(() {});
  }

  Future<void> _loadLive() async {
    try {
      final g = await ApiService.fetchGlobal();
      final m = await ApiService.fetchTopMarkets(perPage: 50);
      if (mounted) setState(() { global = g; markets = m; });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final data = markets.isNotEmpty ? markets : marketsMock;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header('Cryptomentor — AI Trading Suite'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  _modulesGrid(context),
                  const SizedBox(height: 12),
                  MarketOverview(global: global),
                  const SizedBox(height: 12),
                  _marketTable(context, data),
                  if (corpus.isNotEmpty) Card(
  child: Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('AI Training Database (bundled)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        for (final d in corpus)
          ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.amber),
            title: Text(d['path']),
            subtitle: Text((d['content'] as String).split('\n').take(2).join(' ')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainNavBar(current: current, onTap: (i)=> setState(()=> current=i)),
    );
  }

  Widget _modulesGrid(BuildContext ctx){
    final items = [
      ('Trading Signals', const ModuleSignals()),
      ('Token Scanner', const ModuleScanner()),
      ('Research', const ModuleResearch()),
      ('NFT Meme', const ModuleNFT()),
      ('CMT Info', const ModuleCMT()),
      ('Whales Tracker', const ModuleWhales()),
      ('Academy', const ModuleAcademy()),
      ('News', const ModuleNews()),
    ];
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.4),
      itemBuilder: (_, i){
        final (title, screen) = items[i];
        return InkWell(
          onTap: ()=> Navigator.push(ctx, MaterialPageRoute(builder: (_)=> screen)),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF161616), borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kGold.withOpacity(0.3)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.auto_graph, color: kGold),
                const SizedBox(height: 12),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const Spacer(),
                const Align(alignment: Alignment.bottomRight, child: Icon(Icons.chevron_right, color: kGold)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _marketTable(BuildContext ctx, List<dynamic> data){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Market (Top 20)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            for (final m in data.take(20))
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: Text(m['name']?.toString() ?? m['id']?.toString() ?? '-'),
                subtitle: Text((m['symbol']??'').toString().toUpperCase()),
                trailing: Text('\$' + (m['current_price']?.toString() ?? m['price']?.toString() ?? '-')),
              ),
          ],
        ),
      ),
    );
  }
}
