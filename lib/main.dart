
import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/home.dart';
void main()=>runApp(const App());
class App extends StatelessWidget{ const App({super.key});
  @override Widget build(c)=>MaterialApp(debugShowCheckedModeBanner:false, theme:CmtTheme.theme, home: const Home());}
