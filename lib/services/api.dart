import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> fetchGlobal() async {
    final uri = Uri.parse('https://api.coingecko.com/api/v3/global');
    final r = await http.get(uri);
    if (r.statusCode == 200) return json.decode(r.body);
    throw Exception('Global API ${r.statusCode}');
  }

  static Future<List<dynamic>> fetchTopMarkets({int perPage = 50}) async {
    final uri = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$perPage&page=1&sparkline=false&price_change_percentage=24h');
    final r = await http.get(uri);
    if (r.statusCode == 200) return json.decode(r.body) as List;
    throw Exception('Markets API ${r.statusCode}');
  }

  static Future<List<dynamic>> fetchNewsCryptoPanic() async {
    // Free endpoint (no token returns empty), kept for structure; app uses bundled news by default
    final uri = Uri.parse('https://cryptopanic.com/api/free/posts/');
    final r = await http.get(uri);
    if (r.statusCode == 200) {
      final body = json.decode(r.body);
      if (body is Map && body.containsKey('results')) return body['results'] as List;
      return [];
    }
    return [];
  }
}
