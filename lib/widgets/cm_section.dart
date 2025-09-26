import 'package:flutter/material.dart';
class CMSection extends StatelessWidget{
  final String title; final Widget child;
  const CMSection({super.key, required this.title, required this.child});
  @override Widget build(BuildContext c)=>Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
    Padding(padding: const EdgeInsets.fromLTRB(16,12,16,6), child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
    child
  ]);
}