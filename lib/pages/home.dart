import 'package:flutter/material.dart';
Widget _tile(BuildContext c, String t, String route) => ListTile(
  title: Text(t), trailing: const Icon(Icons.chevron_right),
  onTap: ()=>Navigator.pushNamed(c, route),
);
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor')),
      body: ListView(
        children: [
          _tile(c, 'Market', '/market'),
          _tile(c, 'News', '/news'),
          _tile(c, 'Token Scanner', '/scanner'),
          _tile(c, 'Whales', '/whales'),
          _tile(c, 'DEX', '/dex'),
          _tile(c, 'Signals', '/signals'),
          _tile(c, 'Academy', '/academy'),
          _tile(c, 'CMT Hub', '/cmt'),
          _tile(c, 'Launchpad', '/launchpad'),
          _tile(c, 'Community', '/community'),
          _tile(c, 'Events', '/events'),
          _tile(c, 'User', '/user'),
        ],
      ),
    );
  }
}
