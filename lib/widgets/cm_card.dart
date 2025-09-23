import 'package:flutter/material.dart';
class CMCard extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CMCard({super.key, this.leading, required this.title, required this.subtitle, this.trailing, this.onTap});
  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(16);
    return InkWell(
      borderRadius: border,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: border,
          gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF0B1220)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          border: Border.all(color: const Color(0x3322E3B3), width: 1),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (leading != null) Container(margin: const EdgeInsets.only(right: 12), child: leading),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ])),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}