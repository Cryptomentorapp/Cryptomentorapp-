import 'package:flutter/material.dart';
class CMCard extends StatelessWidget {
  final String title; final String value;
  const CMCard({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Container(
    height: 110, padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE2C268), width: 1.2),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white70)),
      const Spacer(),
      Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    ]),
  );
}
