import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.empty);
  };

  runZonedGuarded(() async {
    runApp(const CMApp());
  }, (error, stack) {
    debugPrint('Uncaught startup error: $error');
  });
}

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptomentor',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D1B2),
          background: Color(0xFF0A0E12),
          surface: Color(0xFF121820),
        ),
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({super.key});
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  String? _fatal;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      try {
        await Future.any([Future.delayed(const Duration(milliseconds: 200)), Future.delayed(const Duration(seconds: 3))]);
      } catch (e, s) {
        setState(() => _fatal = 'Startup error: $e');
        debugPrint('Startup error: $e\n$s');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor')),
      body: _fatal != null
          ? Center(child: Text(_fatal!, style: const TextStyle(color: Colors.redAccent)))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _Tile(title: 'Dashboard (demo)'),
                _Tile(title: 'Market'),
                _Tile(title: 'News'),
                _Tile(title: 'Token Scanner'),
                _Tile(title: 'Whales'),
                _Tile(title: 'CMT Hub'),
                _Tile(title: 'Signals'),
                _Tile(title: 'Academy'),
                _Tile(title: 'Launchpad'),
                _Tile(title: 'Community'),
                _Tile(title: 'Events'),
                _Tile(title: 'Settings'),
              ],
            ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  const _Tile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Open: $title (demo)')));
        },
      ),
    );
  }
}