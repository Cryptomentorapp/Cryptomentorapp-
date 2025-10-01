import 'package:flutter/material.dart';

class ModuleItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  ModuleItem({required this.title, required this.icon, required this.onTap});
}

class ModuleGrid extends StatelessWidget {
  final List<ModuleItem> items;
  const ModuleGrid({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, mainAxisExtent: 92, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemBuilder: (_, i) {
        final it = items[i];
        return InkWell(
          onTap: it.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(it.icon, color: Colors.amber, size: 24),
              const SizedBox(height: 8),
              Text(it.title, textAlign: TextAlign.center),
            ],
          ),
        );
      },
    );
  }
}
