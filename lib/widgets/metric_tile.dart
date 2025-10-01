import 'package:flutter/material.dart';

class MetricTile extends StatelessWidget {
  final String title;
  final String value;
  const MetricTile({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
