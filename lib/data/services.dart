import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../theme/styles.dart';

class Api {
  final String base;
  Api(this.base);
  bool get enabled => base.isNotEmpty;
  Future<dynamic> get(String path) async {
    final res = await http.get(Uri.parse("$base$path"));
    if (res.statusCode >= 200 && res.statusCode < 300) return json.decode(res.body);
    throw Exception("HTTP ${res.statusCode}: ${res.body}");
  }
}

class Mock {
  static List<Map<String, dynamic>> marketTop() => [
    {"symbol":"BTC","name":"Bitcoin","price":59240,"change":1.2},
    {"symbol":"ETH","name":"Ethereum","price":2890,"change":0.8},
    {"symbol":"SOL","name":"Solana","price":154.03,"change":-1.4},
    {"symbol":"BNB","name":"BNB","price":529.1,"change":0.3},
  ];
  static List<Map<String, dynamic>> signalsActive() => [
    {"pair":"BTC/USDT","entry":"58,900","sl":"57,400","tp":"60,200","status":"Still Valid","color":CMColors.green.value},
    {"pair":"ETH/USDT","entry":"2,840","sl":"2,780","tp":"2,920","status":"Late Entry","color":CMColors.blue.value},
  ];
  static List<Map<String, dynamic>> signalsHistory() => [
    {"pair":"SOL/USDT","entry":"152.0","sl":"148.0","tp":"158.0","status":"Closed +3.9%","color":CMColors.green.value},
  ];
  static List<Map<String, String>> whalesInflows() => [
    {"addr":"0xA1...3F9","amount":"+\$1.2M"},
    {"addr":"0xB4...8C2","amount":"+\$870k"},
  ];
  static List<Map<String, String>> whalesOutflows() => [
    {"addr":"0xD7...6E1","amount":"-\$690k"},
    {"addr":"0x9C...AA5","amount":"-\$420k"},
  ];
  static List<Map<String, String>> whalesRecents() => [
    {"title":"BTC → 0xA1...","sub":"Buy 120 BTC · 5m ago"},
    {"title":"ETH → 0xB4...","sub":"Sell 2,400 ETH · 12m ago"},
  ];
  static List<Map<String, String>> launchpadPhases() => [
    {"title":"Phase 1","alloc":"20,000,000 CMT","price":"$0.02","start":"01 Sep","end":"07 Sep"},
    {"title":"Phase 2","alloc":"25,000,000 CMT","price":"$0.023","start":"08 Sep","end":"14 Sep"},
    {"title":"Phase 3","alloc":"30,000,000 CMT","price":"$0.025","start":"15 Sep","end":"20 Sep"},
  ];
}

class MarketRepo {
  final _api = Api(kApiBase);
  Future<List<Map<String, dynamic>>> top() async {
    if (_api.enabled) { try { return (await _api.get("/market/top")).cast<Map<String,dynamic>>(); } catch(_){ } }
    return Mock.marketTop();
  }
}

class SignalsRepo {
  final _api = Api(kApiBase);
  Future<List<Map<String, dynamic>>> active() async {
    if (_api.enabled) { try { return (await _api.get("/signals/active")).cast<Map<String,dynamic>>(); } catch(_){ } }
    return Mock.signalsActive();
  }
  Future<List<Map<String, dynamic>>> history() async {
    if (_api.enabled) { try { return (await _api.get("/signals/history")).cast<Map<String,dynamic>>(); } catch(_){ } }
    return Mock.signalsHistory();
  }
}

class WhalesRepo {
  final _api = Api(kApiBase);
  Future<List<Map<String,String>>> inflows() async {
    if (_api.enabled) { try { return (await _api.get("/whales/inflows")).cast<Map<String,String>>(); } catch(_){ } }
    return Mock.whalesInflows();
  }
  Future<List<Map<String,String>>> outflows() async {
    if (_api.enabled) { try { return (await _api.get("/whales/outflows")).cast<Map<String,String>>(); } catch(_){ } }
    return Mock.whalesOutflows();
  }
  Future<List<Map<String,String>>> recents() async {
    if (_api.enabled) { try { return (await _api.get("/whales/recents")).cast<Map<String,String>>(); } catch(_){ } }
    return Mock.whalesRecents();
  }
}

class LaunchpadRepo {
  final _api = Api(kApiBase);
  Future<List<Map<String,String>>> phases() async {
    if (_api.enabled) { try { return (await _api.get("/launchpad/phases")).cast<Map<String,String>>(); } catch(_){ } }
    return Mock.launchpadPhases();
  }
}