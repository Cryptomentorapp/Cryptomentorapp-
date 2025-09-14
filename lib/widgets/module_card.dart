import 'package:flutter/material.dart';
import '../theme.dart';
class ModuleCard extends StatelessWidget {
  final IconData icon; final String title; final VoidCallback onTap;
  const ModuleCard({super.key, required this.icon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: CMTheme.darkCard, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 28, color: CMTheme.gold),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }
}
