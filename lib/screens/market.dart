import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../data/services.dart';
import '../widgets/token_row.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});
  @override State<MarketScreen> createState() => _MarketScreenState();
}
class _MarketScreenState extends State<MarketScreen> with SingleTickerProviderStateMixin {
  late TabController _tabs;
  final repo = MarketRepo();
  List<Map<String, dynamic>> items = [];

  @override void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    _load();
  }

  Future<void> _load() async {
    final data = await repo.top();
    if (!mounted) return;
    setState(()=> items = data);
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market'), bottom: TabBar(controller: _tabs, tabs: const [Tab(text:"All"), Tab(text:"Futures"), Tab(text:"Spot")]), actions: const [Padding(padding: EdgeInsets.only(right:12), child: Icon(Icons.search))]),
      body: TabBarView(controller: _tabs, children: [ _list(), _list(), _list() ]),
    );
  }

  Widget _list() => ListView(children: [
    for (final t in items) TokenRow(symbol: t["symbol"], name: t["name"], price: "\$${t["price"]}", change: "${t["change"]}%", positive: (t["change"] as num) >= 0),
  ]);
}