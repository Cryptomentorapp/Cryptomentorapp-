import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ModuleSignals extends StatefulWidget { const ModuleSignals({{super.key}}); @override State<ModuleSignals> createState()=> _ModuleSignalsState(); }

class _ModuleSignalsState extends State<ModuleSignals> {{
  List<dynamic> data = [];
  @override void initState(){{ super.initState(); _load(); }}
  Future<void> _load() async {{
    final s = await rootBundle.loadString('assets/json/signals.json');
    setState(()=> data = json.decode(s));
  }}
  @override
  Widget build(BuildContext context){{
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, i){{
          final m = data[i];
          return ListTile(
            title: Text(m['title']?.toString() ?? m['name']?.toString() ?? '—'),
            subtitle: Text(m['desc']?.toString() ?? m['pair']?.toString() ?? ''),
          );
        }},
      ),
    );
  }}
}}
