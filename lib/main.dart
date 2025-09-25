import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
class AppState extends ChangeNotifier{}
void main(){ runApp(const CMApp()); }
class CMApp extends StatelessWidget{ const CMApp({super.key});
  @override Widget build(BuildContext context)=>MaterialApp(title:'Cryptomentor', theme: CMTheme.dark(), home: const Placeholder()); }