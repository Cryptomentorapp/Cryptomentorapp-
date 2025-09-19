import 'package:flutter/material.dart';
import '../theme/styles.dart';
import 'market.dart';
import 'signals.dart';
import 'cmt_hub.dart';
import 'launchpad.dart';
import 'whales.dart';
import 'dex.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Cryptomentor')), body: ListView(padding: Insets.screen, children: [
      Container(decoration: BoxDecoration(color: CMColors.panel, borderRadius: BorderRadius.circular(14)), padding: Insets.card, child: Column(children: [
        Row(children: const [Text('Modules', style: TextStyle(fontWeight: FontWeight.w800)), Spacer(), Text('8 tab topside')]), SizedBox(height:12),
        GridView.count(crossAxisCount:4, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), children: [
          _Tile(icon:Icons.show_chart_outlined,label:'Market', route: MarketScreen()),
          _Tile(icon:Icons.bolt_outlined,label:'Signals', route: SignalsScreen()),
          _Tile(icon:Icons.info,label:'CMT', route: CMTHubScreen()),
          _Tile(icon:Icons.rocket_launch,label:'Launchpad', route: LaunchpadScreen()),
          _Tile(icon:Icons.ssid_chart,label:'Whales', route: WhalesScreen()),
          _Tile(icon:Icons.swap_horiz,label:'DEX', route: DexScreen()),
          _Tile(icon:Icons.account_balance_wallet,label:'Wallet', route: Scaffold(appBar: AppBar(title: Text('Wallet')), body: Center(child: Text('Wallet stub')))),
          _Tile(icon:Icons.school,label:'Academy', route: Scaffold(appBar: AppBar(title: Text('Academy')), body: Center(child: Text('Academy stub')))),
        ])
      ])),
      const SizedBox(height:12),
      ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const MarketScreen())), child: const Text('Open Market')),
    ]));
  }
}
class _Tile extends StatelessWidget { final IconData icon; final String label; final Widget route; const _Tile({required this.icon, required this.label, required this.route}); @override Widget build(BuildContext context) => InkWell(onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> route)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: CMColors.gold), SizedBox(height:8), Text(label, style: TextStyle(fontWeight: FontWeight.w800))])); }