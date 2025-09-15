
import 'package:flutter/material.dart';
class ComingSoonPage extends StatelessWidget{ final String title; const ComingSoonPage({super.key, required this.title});
  @override Widget build(c)=>Scaffold(appBar: AppBar(title: Text(title)), body: const Center(child: Text('Coming soon', style: TextStyle(fontSize: 18)))); }
