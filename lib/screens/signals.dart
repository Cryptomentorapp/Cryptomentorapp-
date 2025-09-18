import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../data/services.dart';

class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key});
  @override State<SignalsScreen> createState() => _SignalsScreenState();
}
class _SignalsScreenState extends State<SignalsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabs;
  final repo = SignalsRepo();
  List<Map<String, dynamic>> active = [];
  List<Map<String, dynamic>> hist = [];

  @override void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    _load();
  }

  Future<void> _load() async {
    final a = await repo.active();
    final h = await repo.history();
    if (!mounted) return;
    setState(()=> { active = a, hist = h });
  }

  Widget _card(Map<String, dynamic> s) {
    final color = Color(s["color"] as int);
    return Card(child: Padding(
      padding: Insets.card,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(s["pair"], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text("Entry: ${s["entry"]}"),
        const SizedBox(height: 4),
        Text("SL: ${s["sl"]}  ·  TP: ${s["tp"]}"),
        const SizedBox(height: 8),
        Text("Status: ${s["status"]}", style: TextStyle(color: color)),
      ]),
    ));
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signals'), bottom: TabBar(controller: _tabs, tabs: const [Tab(text:"Active"), Tab(text:"History"), Tab(text:"Watchlist")])),
      body: Padding(
        padding: Insets.screen,
        child: TabBarView(controller: _tabs, children: [
          ListView(children: [for (final s in active)...[_card(s), const SizedBox(height: 12)]]),
          ListView(children: [for (final s in hist)...[_card(s), const SizedBox(height: 12)]]),
          ListView(children: const [ Card(child: ListTile(title: Text("SUI/USDT"), subtitle: Text("Watching"))) ]),
        ]),
      ),
    );
  }
}