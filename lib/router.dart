
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/signals_screen.dart';
import 'screens/dex_screen.dart';
import 'screens/news_screen.dart';
import 'screens/ai_screen.dart';
import 'screens/settings_screen.dart';

class AppRouter extends StatefulWidget{ const AppRouter({super.key}); @override State<AppRouter> createState()=>_AppRouterState(); }

class _AppRouterState extends State<AppRouter>{
  int _i=0;
  final _screens = const [ HomeScreen(), SignalsScreen(), DexScreen(), NewsScreen(), AIScreen(), SettingsScreen() ];
  final _labels = const ['Home','Signals','DEX','News','AI','Settings'];
  final _icons = const [ Icons.home, Icons.trending_up, Icons.swap_horiz, Icons.article_outlined, Icons.smart_toy_outlined, Icons.settings ];

  @override Widget build(BuildContext context){
    return Scaffold(
      body: _screens[_i],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _i,
        onDestinationSelected: (v)=>setState(()=>_i=v),
        destinations: List.generate(_labels.length, (idx)=>NavigationDestination(icon: Icon(_icons[idx]), label: _labels[idx])),
      ),
    );
  }
}
