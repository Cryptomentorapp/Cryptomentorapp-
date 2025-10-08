import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ModuleScanner extends StatefulWidget { const ModuleScanner({{super.key}}); @override State<ModuleScanner> createState()=> _ModuleScannerState(); }

class _ModuleScannerState extends State<ModuleScanner> {{
  List<dynamic> data = [];
  @override void initState(){{ super.initState(); _load(); }}
  Future<void> _load() async {{
    final s = await rootBundle.loadString('assets/json/tokens.json');
    setState(()=> data = json.decode(s));
  }}
  @override
  Widget build(BuildContext context){{
    return Scaffold(
      appBar: AppBar(title: const Text('Token Scanner')),
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
