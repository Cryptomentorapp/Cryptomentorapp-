import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  final String title;
  const ComingSoonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.construction, size: 72, color: Colors.amber),
            const SizedBox(height: 16),
            const Text('Coming soon', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            const Text('Đang tích hợp dữ liệu & logic thật', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
