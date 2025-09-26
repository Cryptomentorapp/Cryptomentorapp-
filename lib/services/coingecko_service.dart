import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class CoinGeckoService{
  static Future<List<dynamic>> topMarkets({int perPage=50}) async {
    final url = Uri.parse('${CMConfig.coingeckoBase}/coins/markets?vs_currency=usd&order=market_cap_desc&per_page='+perPage.toString()+'&page=1&sparkline=false&price_change_percentage=24h');
    final r = await http.get(url);
    if(r.statusCode==200){ return (jsonDecode(r.body) as List); }
    throw Exception('HTTP ${r.statusCode}');
  }

  static Future<Map<String,dynamic>> search(String q) async {
    final url = Uri.parse('${CMConfig.coingeckoBase}/search?query='+Uri.encodeComponent(q));
    final r = await http.get(url);
    if(r.statusCode==200){ return (jsonDecode(r.body) as Map<String,dynamic>); }
    throw Exception('HTTP ${r.statusCode}');
  }

  static Future<Map<String,dynamic>> coinDetail(String id) async {
    final url = Uri.parse('${CMConfig.coingeckoBase}/coins/'+id+'?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false');
    final r = await http.get(url);
    if(r.statusCode==200){ return (jsonDecode(r.body) as Map<String,dynamic>); }
    throw Exception('HTTP ${r.statusCode}');
  }
}