import 'package:flutter/material.dart'; import 'theme.dart'; import 'screens/home_screen.dart';
void main(){runApp(const CMApp());}
class CMApp extends StatelessWidget{const CMApp({super.key});
  @override Widget build(BuildContext c){return MaterialApp(title:'Cryptomentor',debugShowCheckedModeBanner:false,theme:CMTheme.dark(),home:const HomeScreen());}
}
