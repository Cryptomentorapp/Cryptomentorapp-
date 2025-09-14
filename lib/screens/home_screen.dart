import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/module_tile.dart';
import '../widgets/panel.dart';

import 'modules/trading_signals_screen.dart';
import 'modules/token_scanner_screen.dart';
import 'modules/research_hub_screen.dart';
import 'modules/nft_meme_screen.dart';
import 'modules/cmt_info_screen.dart';
import 'modules/whales_tracker_screen.dart';
import 'modules/academy_screen.dart';
import 'modules/news_screen.dart';
import 'modules/community_screen.dart';
import 'modules/events_screen.dart';
import 'modules/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;
  void _open(Widget page) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));

  @override
  Widget build(BuildContext context) {
    final pages = [
      _homeBody(),
      const CommunityScreen(),
      const EventsScreen(),
      const UserScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(children: [
          ClipRRect(borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/logo_cmt.png', height: 36, width: 36)),
          const SizedBox(width: 12),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Cryptomentor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            Text('AI Trading Suite', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
          ]),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.card,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: const Row(children: [Text('🎨 Giao diện', style: TextStyle(color: AppTheme.gold))]),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.forum_rounded), label: 'Community'),
          NavigationDestination(icon: Icon(Icons.event_rounded), label: 'Events'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'User'),
        ],
      ),
      drawer: _sideMenu(context),
      body: pages[_tab],
    );
  }

  Widget _homeBody() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        Panel(
          title: 'Modules',
          trailing: const Text('8 tab topside', style: TextStyle(color: AppTheme.textSecondary)),
          child: GridView(
            padding: const EdgeInsets.only(top: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 12, crossAxisSpacing: 12, mainAxisExtent: 120,
            ),
            children: [
              ModuleTile(icon: Icons.show_chart_rounded, line1: 'Trading', line2: 'Signals',
                onTap: ()=>_open(const TradingSignalsScreen())),
              ModuleTile(icon: Icons.shield_rounded,      line1: 'Token',   line2: 'Scam',
                onTap: ()=>_open(const TokenScannerScreen())),
              ModuleTile(icon: Icons.search_rounded,      line1: 'Research',line2: '',
                onTap: ()=>_open(const ResearchHubScreen())),
              ModuleTile(icon: Icons.extension_rounded,   line1: 'NFT',     line2: 'Meme',
                onTap: ()=>_open(const NftMemeScreen())),
              ModuleTile(icon: Icons.info_rounded,        line1: 'CMT',     line2: 'Info',
                onTap: ()=>_open(const CmtInfoScreen())),
              ModuleTile(icon: Icons.sailing_rounded,     line1: 'Whales',  line2: 'Tracker',
                onTap: ()=>_open(const WhalesTrackerScreen())),
              ModuleTile(icon: Icons.school_rounded,      line1: 'Academy', line2: '',
                onTap: ()=>_open(const AcademyScreen())),
              ModuleTile(icon: Icons.article_rounded,     line1: 'News',    line2: '',
                onTap: ()=>_open(const NewsScreen())),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Panel(
          title: 'Market Overview',
          trailing: FilledButton.tonal(
            onPressed: (){},
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF4B3A16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            child: const Text('Dashboard', style: TextStyle(color: AppTheme.gold, fontWeight: FontWeight.w700)),
          ),
          child: GridView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12, mainAxisExtent: 92,
            ),
            children: const [
              _StatCard(label: 'Total MCap', value: '\$4.19T', delta: '+1.90%'),
              _StatCard(label: 'BTC DOM',   value: '55.18%', delta: null),
              _StatCard(label: 'Fear & Greed', value: '52 Neutral', delta: null),
              _StatCard(label: 'TOTAL1', value: '\$4.19T', delta: null),
              _StatCard(label: 'TOTAL2', value: '\$1.88T', delta: null),
              _StatCard(label: 'TOTAL3 (ex BTC & ETH)', value: '\$1.31T', delta: null),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Panel(
          title: 'Market',
          child: Container(
            height: 260,
            alignment: Alignment.center,
            child: const Text('… bảng Market giống HTML (search + table) — Coming soon',
              style: TextStyle(color: AppTheme.textSecondary)),
          ),
        ),
      ],
    );
  }

  Drawer _sideMenu(BuildContext context) => Drawer(
    backgroundColor: AppTheme.panel,
    child: SafeArea(
      child: ListView(padding: const EdgeInsets.all(16), children: const [
        ListTile(leading: Icon(Icons.grid_view_rounded, color: AppTheme.gold), title: Text('Market Overview')),
        ListTile(leading: Icon(Icons.sailing_rounded,   color: AppTheme.gold), title: Text('Whales Tracker')),
        ListTile(leading: Icon(Icons.swap_horiz_rounded,color: AppTheme.gold), title: Text('DEX')),
      ]),
    ),
  );
}

class _StatCard extends StatelessWidget {
  final String label, value; final String? delta;
  const _StatCard({required this.label, required this.value, this.delta});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          if (delta != null) ...[
            const SizedBox(height: 6),
            Text(delta!, style: TextStyle(
              color: delta!.startsWith('-') ? AppTheme.red : AppTheme.green,
              fontWeight: FontWeight.w700,
            )),
          ]
        ]),
      ),
    );
  }
}
