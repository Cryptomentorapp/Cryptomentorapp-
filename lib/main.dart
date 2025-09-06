
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CMApp());
}

class CMApp extends StatelessWidget {
  const CMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const CMWeb(),
    );
  }
}

class CMWeb extends StatefulWidget {
  const CMWeb({super.key});
  @override
  State<CMWeb> createState() => _CMWebState();
}

class _CMWebState extends State<CMWeb> {
  late final WebViewController _c;

  Future<void> _load(String asset) async {
    await _c.loadFlutterAsset('assets/$asset');
  }

  @override
  void initState() {
    super.initState();
    _c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (req) {
            final url = req.url;
            // When HTML triggers location change to our asset files, intercept and load
            if (url.endsWith('cm_academy.html')) {
              _load('cm_academy.html');
              return NavigationDecision.prevent;
            } else if (url.endsWith('cm_module4_token_scanner.html')) {
              _load('cm_module4_token_scanner.html');
              return NavigationDecision.prevent;
            } else if (url.endsWith('Cryptomentorapp.html')) {
              _load('Cryptomentorapp.html');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadFlutterAsset('assets/Cryptomentorapp.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _c)),
    );
  }
}
