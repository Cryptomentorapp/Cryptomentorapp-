
import 'package:flutter/material.dart';
class InfoCard extends StatelessWidget {
  final String title; final String value;
  const InfoCard({super.key, required this.title, required this.value});
  @override Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16, vertical:18),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
