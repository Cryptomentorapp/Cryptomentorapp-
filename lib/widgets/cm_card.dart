import 'package:flutter/material.dart';
class CMCard extends StatelessWidget {
  final Widget child;
  const CMCard({super.key, required this.child});
  @override
  Widget build(BuildContext context)=>Card(child: Padding(padding: const EdgeInsets.all(16), child: child));
}