import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
class ModuleTile extends StatelessWidget {
  final IconData icon;
  final String line1;
  final String? line2;
  final VoidCallback onTap;
  const ModuleTile({
    super.key,
    required this.icon,
    required this.line1,
    this.line2,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: AppTheme.card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 6)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.panel,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(icon, color: AppTheme.gold, size: 26),
              ),
              const SizedBox(height: 14),
              Text(line1, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              if (line2 != null) ...[
                const SizedBox(height: 4),
                Text(line2!, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
