import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/market_screen.dart';
import 'screens/signals_screen.dart';
import 'screens/token_scanner_screen.dart';
import 'screens/academy_screen.dart';
import 'screens/news_screen.dart';
import 'screens/research_screen.dart';
import 'screens/whales_screen.dart';
import 'widgets/kpi_card.dart';

void main(){ runApp(ChangeNotifierProvider(create:(_)=>ThemeController(), child: const App())); }

class ThemeController extends ChangeNotifier{
  ThemeMode mode = ThemeMode.dark;
  int scheme = 0; // 0: dark, 1: light gold, 2: light blue
  void next(){
    scheme = (scheme + 1) % 3;
    mode = scheme==0?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
  ThemeData get light1 => ThemeData(
    brightness: Brightness.light, colorSchemeSeed: const Color(0xFFd4af37), useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF8F6F1),
  );
  ThemeData get light2 => ThemeData(
    brightness: Brightness.light, colorSchemeSeed: const Color(0xFF1e88e5), useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF6FAFF),
  );
  ThemeData get dark => ThemeData(
    brightness: Brightness.dark, colorSchemeSeed: const Color(0xFFd4af37), useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF0f0e0c),
  );
  ThemeData theme(BuildContext ctx){
    if(scheme==1) return light1;
    if(scheme==2) return light2;
    return dark;
  }
}

class App extends StatelessWidget{
  const App({super.key});
  @override Widget build(BuildContext context){
    final tc = Provider.of<ThemeController>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptomentor',
      theme: tc.light1, darkTheme: tc.dark, themeMode: tc.mode,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  Widget tile(BuildContext ctx, IconData ico, String label, Widget screen){
    return InkWell(
      onTap: ()=>Navigator.push(ctx, MaterialPageRoute(builder:(_)=>screen)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.white.withOpacity(0.06), Colors.white.withOpacity(0.02)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
          Icon(ico, size: 26),
          const SizedBox(height:8),
          Text(label, textAlign: TextAlign.center),
        ]),
      ),
    );
  }

  @override Widget build(BuildContext context){
    final tc = Provider.of<ThemeController>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptomentor – AI Trading Suite'),
        actions: [
          IconButton(onPressed: ()=>tc.next(), icon: const Icon(Icons.color_lens_outlined), tooltip: 'Đổi giao diện'),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(16), children:[
        Text('Modules', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height:8),
        GridView.count(crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10,
          shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
            tile(context, Icons.show_chart, 'Trading\nSignals', const SignalsScreen()),
            tile(context, Icons.shield, 'Token\nScam', const TokenScannerScreen()),
            tile(context, Icons.search, 'Research', const ResearchScreen()),
            tile(context, Icons.extension, 'NFT Meme', const ComingSoon(title:'NFT Meme')),
            tile(context, Icons.info, 'CMT Info', const ComingSoon(title:'CMT Info')),
            tile(context, Icons.sailing, 'Whales\nTracker', const WhalesScreen()),
            tile(context, Icons.school, 'Academy', const AcademyScreen()),
            tile(context, Icons.article, 'News', const NewsScreen()),
          ]),
        const SizedBox(height:16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
          Text('Market Overview', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          FilledButton.tonal(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder:(_)=>const MarketScreen())), child: const Text('Dashboard')),
        ]),
        const SizedBox(height:10),
        const Row(children: [
          Expanded(child: KpiCard(title:'Total MCap', value:'$3.83T', sub:'1.45%')),
          SizedBox(width:10),
          Expanded(child: KpiCard(title:'BTC DOM', value:'56.19%')),
          SizedBox(width:10),
          Expanded(child: KpiCard(title:'Fear & Greed', value:'46 Fear')),
        ]),
        const SizedBox(height:16),
        const Center(child: Text('CMT Max Supply = 2,000,000,000')),
      ]),
      bottomNavigationBar: const NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label:'Home'),
        NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label:'Community'),
        NavigationDestination(icon: Icon(Icons.event_outlined), selectedIcon: Icon(Icons.event), label:'Events'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label:'User'),
      ], selectedIndex: 0),
    );
  }
}

class ComingSoon extends StatelessWidget{
  final String title; const ComingSoon({super.key, required this.title});
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text(title)), body: const Center(child: Text('Coming soon')));
  }
}
