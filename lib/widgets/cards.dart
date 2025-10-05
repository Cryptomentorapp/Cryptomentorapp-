
import 'package:flutter/material.dart';
import '../app_theme.dart';

class CMCard extends StatelessWidget{
  final Widget child;
  final EdgeInsets padding;
  const CMCard({super.key, required this.child, this.padding=const EdgeInsets.all(14)});
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF121521),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

Widget goldBadge(String text)=>Container(
  padding: const EdgeInsets.symmetric(horizontal:10, vertical:6),
  decoration: BoxDecoration(
    gradient: const LinearGradient(colors: [Color(0xFFF6C86E), Color(0xFFFFE9B4)]),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
);
