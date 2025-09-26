import 'package:flutter/material.dart';
class CMCard extends StatelessWidget{
  final Widget child;
  const CMCard({super.key, required this.child});
  @override Widget build(BuildContext c)=>Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), child: Padding(padding: const EdgeInsets.all(12), child: child));
}