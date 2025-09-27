import 'package:flutter/material.dart'; import '../widgets/cm_card.dart';
class DashboardPage extends StatelessWidget{ const DashboardPage({super.key});
  @override Widget build(BuildContext c)=>ListView(padding: const EdgeInsets.all(16), children:[
    const CMCard(child: Text('Cryptomentor — Dashboard')),
    const SizedBox(height:12),
    CMCard(child: Wrap(spacing: 8, runSpacing: 8, children: [
      FilledButton(onPressed: ()=>Navigator.pushNamed(c, '/academy'), child: const Text('Academy')),
      FilledButton(onPressed: ()=>Navigator.pushNamed(c, '/launchpad'), child: const Text('Launchpad')),
      FilledButton(onPressed: ()=>Navigator.pushNamed(c, '/community'), child: const Text('Community')),
      FilledButton(onPressed: ()=>Navigator.pushNamed(c, '/events'), child: const Text('Events')),
      FilledButton(onPressed: ()=>Navigator.pushNamed(c, '/user'), child: const Text('User')),
    ])),
    const SizedBox(height:12),
    const CMCard(child: Text('Modules: Market · News · Scanner · Whales · CMT Hub · Signals · Admin · Settings')),
  ]); }