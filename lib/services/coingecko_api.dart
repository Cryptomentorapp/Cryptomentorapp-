import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinGeckoApi {
  static const _base = 'https://api.coingecko.com/api/v3';
  static Future<List<dynamic>> markets({int perPage = 100, int page = 1}) async {
    final uri = Uri.parse('$_base/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$perPage&page=$page&sparkline=false&price_change_percentage=24h');
    final res = await http.get(uri, headers: {'Accept': 'application/json'});
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as List<dynamic>;
    }
    throw Exception('CoinGecko markets error: ${res.statusCode}');
  }
}
