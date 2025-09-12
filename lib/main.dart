import 'package:flutter/material.dart';
import 'modules/signals.dart';
import 'modules/scanner.dart';
import 'modules/research.dart';
import 'modules/news.dart';
import 'modules/academy.dart';

void main() => runApp(const CryptomentorApp());

class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptomentor',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomeRoot(),
    );
  }
}

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});
  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  int _idx = 0;
  final _pages = const [SignalsPage(), ScannerPage(), ResearchPage(), NewsPage(), AcademyPage()];
  final _labels = const ['Signals','Scanner','Research','News','Academy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor')),
      body: _pages[_idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i)=>setState(()=>_idx=i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'Signals'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Scanner'),
          NavigationDestination(icon: Icon(Icons.science), label: 'Research'),
          NavigationDestination(icon: Icon(Icons.article), label: 'News'),
          NavigationDestination(icon: Icon(Icons.school), label: 'Academy'),
        ],
      ),
    );
  }
}
