import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/cm_card.dart';
class DashboardPage extends StatelessWidget{
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext c)=>ListView(padding: const EdgeInsets.all(16), children:[
    CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      Text('Cryptomentor — FULL MAX'), SizedBox(height:8),
      Text('Modules: Market · News · Scanner · Whales · CMT Hub · Signals · Admin · Settings'),
    ])),
  ]);
}