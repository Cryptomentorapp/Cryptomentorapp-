import 'package:flutter/material.dart';
import '../utils/theme.dart';

class Header extends StatelessWidget {
  final String title;
  const Header(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: goldGradient(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
          const Icon(Icons.auto_graph, color: kGold)
        ],
      ),
    );
  }
}
