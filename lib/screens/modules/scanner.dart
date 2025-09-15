
import 'package:flutter/material.dart';
class ScannerPage extends StatefulWidget{ const ScannerPage({super.key}); @override State<ScannerPage> createState()=>_ScannerPageState();}
class _ScannerPageState extends State<ScannerPage>{ final c=TextEditingController(); @override Widget build(cxt)=>Scaffold(appBar: AppBar(title: const Text('Token Scanner')), body: Padding(padding: const EdgeInsets.all(16), child: Column(children:[ TextField(controller:c, decoration: const InputDecoration(hintText: '0x... contract address', border: OutlineInputBorder())), const SizedBox(height:12), ElevatedButton(onPressed:(){ ScaffoldMessenger.of(cxt).showSnackBar(const SnackBar(content: Text('Risk scan coming soon'))); }, child: const Text('Scan')) ]))); }
