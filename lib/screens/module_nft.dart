import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ModuleNFT extends StatefulWidget { const ModuleNFT({{super.key}}); @override State<ModuleNFT> createState()=> _ModuleNFTState(); }

class _ModuleNFTState extends State<ModuleNFT> {{
  List<dynamic> data = [];
  @override void initState(){{ super.initState(); _load(); }}
  Future<void> _load() async {{
    final s = await rootBundle.loadString('assets/json/tokens.json');
    setState(()=> data = json.decode(s));
  }}
  @override
  Widget build(BuildContext context){{
    return Scaffold(
      appBar: AppBar(title: const Text('NFT Meme')),
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
