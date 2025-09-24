import 'dart:convert'; import 'package:flutter/material.dart'; import 'package:flutter/services.dart' show rootBundle;
class WhalesPage extends StatefulWidget { const WhalesPage({super.key}); @override State<WhalesPage> createState()=>_WhalesPageState(); }
class _WhalesPageState extends State<WhalesPage>{
  List<dynamic> items=[];
  @override void initState(){ super.initState(); load(); }
  Future<void> load() async { final s=await rootBundle.loadString('assets/whales_top50.json'); items=jsonDecode(s); setState((){}); }
  @override Widget build(BuildContext context)=>ListView.separated(
    padding: const EdgeInsets.all(12), itemCount: items.length,
    itemBuilder: (_,i){ final w=items[i]; return Card(child: ListTile(
      title: Text((w['label']??'').toString()), subtitle: Text(((w['chain']??'').toString())+' · '+((w['address']??'').toString())),
      trailing: const Icon(Icons.copy), onTap: (){})); },
    separatorBuilder: (_,__)=>const SizedBox(height:8));
}