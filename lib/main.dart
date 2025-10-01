import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/market_screen.dart';
import 'screens/news_screen.dart';
import 'screens/token_scanner_screen.dart';
import 'screens/whales_screen.dart';
import 'screens/dex_screen.dart';
import 'screens/signals_screen.dart';
import 'screens/academy_screen.dart';
import 'screens/cmt_hub_screen.dart';
import 'screens/launchpad_screen.dart';
import 'screens/community_screen.dart';
import 'screens/events_screen.dart';
import 'screens/user_screen.dart';

void main() => runApp(const App());
class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptomentor',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/market': (_) => const MarketScreen(),
        '/news': (_) => const NewsScreen(),
        '/token_scanner': (_) => const TokenScannerScreen(),
        '/whales': (_) => const WhalesScreen(),
        '/dex': (_) => const DexScreen(),
        '/signals': (_) => const SignalsScreen(),
        '/academy': (_) => const AcademyScreen(),
        '/cmt': (_) => const CMTHubScreen(),
        '/launchpad': (_) => const LaunchpadScreen(),
        '/community': (_) => const CommunityScreen(),
        '/events': (_) => const EventsScreen(),
        '/user': (_) => const UserScreen(),
      },
    );
  }
}
