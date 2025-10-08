import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ModuleWhales extends StatefulWidget { const ModuleWhales({{super.key}}); @override State<ModuleWhales> createState()=> _ModuleWhalesState(); }

class _ModuleWhalesState extends State<ModuleWhales> {{
  List<dynamic> data = [];
  @override void initState(){{ super.initState(); _load(); }}
  Future<void> _load() async {{
    final s = await rootBundle.loadString('assets/json/tokens.json');
    setState(()=> data = json.decode(s));
  }}
  @override
  Widget build(BuildContext context){{
    return Scaffold(
      appBar: AppBar(title: const Text('Whales Tracker')),
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
