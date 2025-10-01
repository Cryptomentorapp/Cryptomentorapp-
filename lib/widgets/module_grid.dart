import 'package:flutter/material.dart';
class ModuleGrid extends StatelessWidget {
  const ModuleGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      ('Trading\nSignals', Icons.show_chart, '/signals'),
      ('Token\nScanner', Icons.shield, '/token_scanner'),
      ('Research', Icons.travel_explore, '/cmt'),
      ('NFT\nMeme', Icons.extension, '/cmt'),
      ('CMT\nInfo', Icons.info, '/cmt'),
      ('Whales\nTracker', Icons.sailing, '/whales'),
      ('Academy', Icons.school, '/academy'),
      ('News', Icons.article, '/news'),
    ];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: 92, crossAxisSpacing: 12, mainAxisSpacing: 12,
          ),
          itemBuilder: (context, i) {
            final (title, icon, route) = items[i];
            return InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.pushNamed(context, route),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                    colors: [Color(0xFF1A2030), Color(0xFF0F121A)],
                  ),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(icon, size: 22), const Spacer(),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
