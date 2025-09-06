import 'package:flutter/material.dart';

enum RiskLevel { safe, warning, high }

class RiskBadge extends StatelessWidget {
  final RiskLevel level;
  final String? label;
  const RiskBadge({super.key, required this.level, this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color bg; Color fg; String text;
    switch (level) {
      case RiskLevel.safe:
        bg = Colors.green.withOpacity(0.12);
        fg = Colors.green.shade800;
        text = label ?? 'Safe';
        break;
      case RiskLevel.warning:
        bg = Colors.orange.withOpacity(0.12);
        fg = Colors.orange.shade800;
        text = label ?? 'Warning';
        break;
      case RiskLevel.high:
        bg = Colors.red.withOpacity(0.12);
        fg = Colors.red.shade800;
        text = label ?? 'High Risk';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: fg.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shield, size: 14, color: fg),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(color: fg, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
