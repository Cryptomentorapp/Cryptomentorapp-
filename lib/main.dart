import 'package:flutter/material.dart';
import 'theme/styles.dart';
import 'screens/home.dart';
void main() => runApp(const CMApp());
class CMApp extends StatelessWidget { const CMApp({super.key}); @override Widget build(BuildContext context) => MaterialApp(title:'Cryptomentor', theme: buildAppTheme(), debugShowCheckedModeBanner:false, home: const HomeScreen()); }