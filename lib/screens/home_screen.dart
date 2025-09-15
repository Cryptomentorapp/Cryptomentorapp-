import 'package:flutter/material.dart';
import '../theme/themes.dart';
import 'modules/modules.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../services/market_api.dart';
import '../services/news_api.dart';

class HomeScreen extends StatefulWidget {
  final ThemeController controller;
  const HomeScreen({super.key, required this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;
  Map<String, dynamic>? _global;
  List<NewsItem> _news = [];
  bool _loading = true;

  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    try{
      final g = await MarketAPI.global();
      final n = await NewsAPI.top();
      setState((){ _global = g; _news = n.take(5).toList(); });
    } catch(_){}
    setState(()=>_loading=false);
  }

  void _open(Widget page) { Navigator.of(context).push(MaterialPageRoute(builder: (_) => page)); }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();
    final pages = [
      _homeBody(),
      const _ComingSoon(title: 'Community'),
      const _ComingSoon(title: 'Events'),
      const _ComingSoon(title: 'User'),
    ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/logo_cmt.png', height: 34, width: 34),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Cryptomentor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                Text('AI Trading Suite', style: TextStyle(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FilledButton.tonal(
              onPressed: _pickTheme,
              child: const Text('🎨 Giao diện'),
            ),
          ),
        ],
      ),
      body: pages[_tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i)=>setState(()=>_tab=i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.forum_rounded), label: 'Community'),
          NavigationDestination(icon: Icon(Icons.event_rounded), label: 'Events'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'User'),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              if (auth.email != null)
                ListTile(
                  leading: const Icon(Icons.verified_user_rounded),
                  title: Text(auth.email!),
                  subtitle: const Text('Admin'),
                ),
              const Divider(),
              const ListTile(leading: Icon(Icons.grid_view_rounded), title: Text('Market Overview')),
              const ListTile(leading: Icon(Icons.sailing_rounded), title: Text('Whales Tracker')),
              const ListTile(leading: Icon(Icons.swap_horiz_rounded), title: Text('DEX')),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
                title: const Text('Đăng xuất'),
                onTap: () { Navigator.pop(context); context.read<AuthController>().logout(); },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeBody() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: const [
                  Text('Modules', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  Spacer(),
                  Text('8 tab topside', style: TextStyle(color: Colors.white70)),
                ]),
                const SizedBox(height: 12),
                GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 12, mainAxisSpacing: 12, mainAxisExtent: 110,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ModuleTile(icon: Icons.show_chart_rounded, line1: 'Trading', line2: 'Signals',
                      onTap: ()=>_open(const TradingSignalsScreen())),
                    ModuleTile(icon: Icons.shield_rounded, line1: 'Token', line2: 'Scam',
                      onTap: ()=>_open(const TokenScannerScreen())),
                    ModuleTile(icon: Icons.search_rounded, line1: 'Research', line2: 'Hub',
                      onTap: ()=>_open(const ResearchHubScreen())),
                    ModuleTile(icon: Icons.extension_rounded, line1: 'NFT', line2: 'Meme',
                      onTap: ()=>_open(const NFTMemeScreen())),
                    ModuleTile(icon: Icons.info_rounded, line1: 'CMT', line2: 'Info',
                      onTap: ()=>_open(const CMTInfoScreen())),
                    ModuleTile(icon: Icons.sailing_rounded, line1: 'Whales', line2: 'Tracker',
                      onTap: ()=>_open(const WhalesTrackerScreen())),
                    ModuleTile(icon: Icons.school_rounded, line1: 'Academy', line2: '',
                      onTap: ()=>_open(const AcademyScreen())),
                    ModuleTile(icon: Icons.article_rounded, line1: 'News', line2: '',
                      onTap: ()=>_open(const NewsScreen())),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text('Market Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  const Spacer(),
                  FilledButton.tonal(onPressed: (){}, child: const Text('Dashboard')),
                ]),
                const SizedBox(height: 12),
                _loading || _global==null ? const _OverviewSkeleton() : _OverviewLive(global: _global!),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Text('Tin mới', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        if (_loading) const Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator())),
        if (!_loading) ..._news.map((n)=> Card(child: ListTile(title: Text(n.title), subtitle: Text(n.source)))).toList(),
      ],
    );
  }

  void _pickTheme() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const ListTile(title: Text('Chọn giao diện (theme)')),
          ListTile(leading: const Icon(Icons.brightness_3_rounded), title: const Text('Dark (navy-gold)'),
            onTap: () { widget.controller.set(CmtThemeMode.dark); Navigator.pop(context); }),
          ListTile(leading: const Icon(Icons.wb_sunny_rounded), title: const Text('Light'),
            onTap: () { widget.controller.set(CmtThemeMode.light); Navigator.pop(context); }),
          ListTile(leading: const Icon(Icons.wb_twighlight), title: const Text('Gold Light'),
            onTap: () { widget.controller.set(CmtThemeMode.goldLight); Navigator.pop(context); }),
          const SizedBox(height: 6),
        ]),
      ),
    );
  }
}

class _OverviewSkeleton extends StatelessWidget {
  const _OverviewSkeleton();
  @override Widget build(BuildContext context) {
    Widget box()=> Container(decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
      height: 80);
    return Row(children: [Expanded(child: box()), const SizedBox(width: 12), Expanded(child: box()), const SizedBox(width: 12), Expanded(child: box())]);
  }
}

class _OverviewLive extends StatelessWidget {
  final Map<String, dynamic> global;
  const _OverviewLive({required this.global});

  @override Widget build(BuildContext context) {
    final mcap = global['total_market_cap']['usd'] as num?;
    final btcDom = global['market_cap_percentage']['btc'] as num?;
    final ethDom = global['market_cap_percentage']['eth'] as num?;
    return Row(children: [
      Expanded(child: StatCard(label: 'Total MCap', value: mcap==null?'—':MarketAPI.usdHuman(mcap), sub: '')),
      const SizedBox(width: 12),
      Expanded(child: StatCard(label: 'BTC DOM', value: btcDom==null?'—':'${btcDom.toStringAsFixed(2)}%', sub: '')),
      const SizedBox(width: 12),
      Expanded(child: StatCard(label: 'ETH %', value: ethDom==null?'—':'${ethDom.toStringAsFixed(2)}%', sub: '')),
    ]);
  }
}

class StatCard extends StatelessWidget {
  final String label, value, sub;
  const StatCard({super.key, required this.label, required this.value, required this.sub});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        if (sub.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(sub, style: TextStyle(color: sub.startsWith('-') ? Colors.redAccent : Colors.greenAccent)),
        ],
      ]),
    );
  }
}

class ModuleTile extends StatelessWidget {
  final IconData icon;
  final String line1, line2;
  final VoidCallback onTap;
  const ModuleTile({super.key, required this.icon, required this.line1, required this.line2, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, size: 26, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 10),
            Text(line1, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            if (line2.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(line2, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
            ]
          ]),
        ),
      ),
    );
  }
}

class _ComingSoon extends StatelessWidget {
  final String title;
  const _ComingSoon({required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$title — Coming soon', style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)));
  }
}
