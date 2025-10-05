
import 'package:flutter/material.dart';
import '../widgets/cards.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text('Cryptomentor'),
        ),
        SliverList.list(children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: CMCard(child: Text('🔥 Welcome to Cryptomentor — demo build')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: CMCard(child: Text('• Quick stats\n• Latest signals\n• News highlights\n• AI tips')),
          ),
        ]),
      ],
    );
  }
}
