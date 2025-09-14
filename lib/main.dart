
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main()=>runApp(const CMApp());
class CMApp extends StatelessWidget{
  const CMApp({super.key});
  @override Widget build(BuildContext c){
    return MaterialApp(
      title:'Cryptomentor',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1C150E),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD4AF37), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
