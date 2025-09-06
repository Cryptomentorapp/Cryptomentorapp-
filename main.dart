import 'package:flutter/material.dart';
import 'widgets/feature_gate.dart';
import 'screens/coming_soon_page.dart';
import 'widgets/risk_badge.dart';
import 'utils/number_format.dart';
import 'utils/ws_binance.dart';

const kFeatureDEX      = bool.fromEnvironment('FEATURE_DEX', defaultValue: false);
const kFeatureWhales   = bool.fromEnvironment('FEATURE_WHALES', defaultValue: false);
const kFeatureAdmin    = bool.fromEnvironment('FEATURE_ADMIN', defaultValue: false);
const kFeatureGuardian = bool.fromEnvironment('FEATURE_GUARDIAN', defaultValue: false);

const kCmtMaxSupply = int.fromEnvironment('CMT_MAX_SUPPLY', defaultValue: 2000000000);

void main() {
  runApp(const CryptomentorApp());
}

class CryptomentorApp extends StatelessWidget {
  const CryptomentorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptomentor',
      theme: ThemeData(colorSchemeSeed: Colors.amber, useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(colorSchemeSeed: Colors.amber, useMaterial3: true, brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _price = 0;

  @override
  void initState() {
    super.initState();
    // Demo: poll BTCUSDT price and show on card
    final ws = BinanceWS(
      symbol: 'btcusdt',
      onPrice: (p) => setState(() => _price = p),
    );
    ws.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cryptomentor – MVP')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('BTC/USDT (live-ish)'),
              subtitle: Text(_price == 0 ? 'Loading...' : '\$${formatCompact(_price)}'),
            ),
          ),
          const SizedBox(height: 8),
          _tile(context, 'Market Overview', const MarketScreen()),
          _tile(context, 'Trading Signals', const SignalsScreen()),
          _tile(context, 'Risk Scanner', const RiskScannerScreen()),
          _tile(context, 'Academy', const AcademyScreen()),
          // Coming soon gates (still clickable)
          _tile(context, 'DEX', FeatureGate(enabled: kFeatureDEX, child: const DexScreen(), comingSoonTitle: 'DEX (1inch + Binance)')),
          _tile(context, 'Whales Tracker', FeatureGate(enabled: kFeatureWhales, child: const WhalesScreen(), comingSoonTitle: 'Whales Tracker')),
          _tile(context, 'Admin Panel', FeatureGate(enabled: kFeatureAdmin, child: const AdminScreen(), comingSoonTitle: 'Admin Panel')),
          _tile(context, 'AI Guardian', FeatureGate(enabled: kFeatureGuardian, child: const GuardianScreen(), comingSoonTitle: 'AI Guardian')),
          const SizedBox(height: 16),
          Center(child: Text('CMT Max Supply = ${kCmtMaxSupply.toString()}')),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, String title, Widget screen) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      ),
    );
  }
}

// Placeholder "done" screens (simple stubs)
class MarketScreen extends StatelessWidget { const MarketScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Market Overview')), body: const Center(child: Text('Market content here')));
}
class SignalsScreen extends StatelessWidget { const SignalsScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Trading Signals')), body: const Center(child: Text('Signals content here')));
}
class RiskScannerScreen extends StatelessWidget { const RiskScannerScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Risk Scanner')), body: Center(child: RiskBadge(level: RiskLevel.warning)));
}
class AcademyScreen extends StatelessWidget { const AcademyScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Academy')), body: const Center(child: Text('Academy content here')));
}

// Coming soon gated screens (real screens can replace these)
class DexScreen extends StatelessWidget { const DexScreen({super.key});
  @override Widget build(BuildContext context) => const ComingSoonInline(message: 'DEX đang hoàn thiện.');
}
class WhalesScreen extends StatelessWidget { const WhalesScreen({super.key});
  @override Widget build(BuildContext context) => const ComingSoonInline(message: 'Whales tracker đang hoàn thiện.');
}
class AdminScreen extends StatelessWidget { const AdminScreen({super.key});
  @override Widget build(BuildContext context) => const ComingSoonInline(message: 'Admin Panel đang hoàn thiện.');
}
class GuardianScreen extends StatelessWidget { const GuardianScreen({super.key});
  @override Widget build(BuildContext context) => const ComingSoonInline(message: 'AI Guardian đang hoàn thiện.');
}
