import 'package:flutter/material.dart';
import '../widgets/module_card.dart';
import 'trading_signals_screen.dart';
import 'token_scanner_screen.dart';
import 'research_hub_screen.dart';
class HomeScreen extends StatelessWidget{const HomeScreen({super.key});
  @override Widget build(BuildContext c){
    return Scaffold(appBar: AppBar(title: const Text('Cryptomentor – MVP')),body:ListView(padding:const EdgeInsets.all(16),children:[
      const Text('Modules',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),const SizedBox(height:12),
      GridView.count(crossAxisCount:4,shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),crossAxisSpacing:12,mainAxisSpacing:12,childAspectRatio:.9,children:[
        ModuleCard(icon: Icons.show_chart,title:'Trading\nSignals',onTap:(){Navigator.push(c,MaterialPageRoute(builder:(_)=>const TradingSignalsScreen()));}),
        ModuleCard(icon: Icons.shield,title:'Token\nScam',onTap:(){Navigator.push(c,MaterialPageRoute(builder:(_)=>const TokenScannerScreen()));}),
        ModuleCard(icon: Icons.search,title:'Research',onTap:(){Navigator.push(c,MaterialPageRoute(builder:(_)=>const ResearchHubScreen()));}),
        ModuleCard(icon: Icons.note_alt,title:'NFT\nMeme',onTap:(){}),
        ModuleCard(icon: Icons.info,title:'CMT\nInfo',onTap:(){}),
        ModuleCard(icon: Icons.sailing,title:'Whales\nTracker',onTap:(){}),
        ModuleCard(icon: Icons.school,title:'Academy',onTap:(){}),
        ModuleCard(icon: Icons.newspaper,title:'News',onTap:(){}),
      ]),
      const SizedBox(height:16),
      const Text('Market Overview',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),const SizedBox(height:8),
      Wrap(spacing:12,runSpacing:12,children:const[ _Stat(label:'Total MCap',value:'$3.83T'), _Stat(label:'BTC DOM',value:'56.19%'), _Stat(label:'Fear & Greed',value:'46 Fear'), ]),
      const SizedBox(height:16), const Text('CMT Max Supply = 2,000,000,000'),
    ]),
    bottomNavigationBar: NavigationBar(destinations: const [
      NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.forum), label: 'Community'),
      NavigationDestination(icon: Icon(Icons.event), label: 'Events'),
      NavigationDestination(icon: Icon(Icons.person), label: 'User'),
    ], selectedIndex: 0,),);
  }
}
class _Stat extends StatelessWidget{final String label,value; const _Stat({required this.label, required this.value});
  @override Widget build(BuildContext c){return Container(width:180,padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:Theme.of(c).cardColor,borderRadius:BorderRadius.circular(16)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label),const SizedBox(height:6),Text(value,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),],),);}
}
