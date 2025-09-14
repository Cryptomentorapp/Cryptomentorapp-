import 'package:flutter/material.dart';
import '../widgets/module_card.dart';
import 'signals/signals_screen.dart';
import 'scanner/scanner_screen.dart';
import 'research/research_screen.dart';
import 'news/news_screen.dart';
import 'academy/academy_screen.dart';
import 'whales/whales_screen.dart';
import 'cmt_info/cmt_info_screen.dart';
import 'admin/admin_screen.dart';
import 'ai_chat/ai_chat_screen.dart';
class HomeScreen extends StatelessWidget{const HomeScreen({super.key}); @override Widget build(BuildContext c){return Scaffold(appBar: AppBar(title: const Text('Cryptomentor – Modules')), body: ListView(padding: const EdgeInsets.all(16), children:[GridView.count(crossAxisCount:4, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), crossAxisSpacing:12, mainAxisSpacing:12, childAspectRatio:.9, children:[ModuleCard(icon: Icons.show_chart, title:'Trading\nSignals', onTap: ()=>_go(c,const SignalsScreen())), ModuleCard(icon: Icons.shield, title:'Token\nScanner', onTap: ()=>_go(c,const ScannerScreen())), ModuleCard(icon: Icons.auto_awesome, title:'Research\nHub', onTap: ()=>_go(c,const ResearchScreen())), ModuleCard(icon: Icons.newspaper, title:'News', onTap: ()=>_go(c,const NewsScreen())), ModuleCard(icon: Icons.school, title:'Academy', onTap: ()=>_go(c,const AcademyScreen())), ModuleCard(icon: Icons.sailing, title:'Whales\nTracker', onTap: ()=>_go(c,const WhalesScreen())), ModuleCard(icon: Icons.info, title:'CMT\nInfo', onTap: ()=>_go(c,const CmtInfoScreen())), ModuleCard(icon: Icons.admin_panel_settings, title:'Admin\nPanel', onTap: ()=>_go(c,const AdminScreen())), ModuleCard(icon: Icons.chat_bubble, title:'CMT\nAI Chat', onTap: ()=>_go(c,const AiChatScreen())),])]);}
void _go(BuildContext c, Widget w)=>Navigator.push(c, MaterialPageRoute(builder:(_)=>w));}
