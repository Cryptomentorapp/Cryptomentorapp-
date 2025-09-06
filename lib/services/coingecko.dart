import 'dart:convert';
import 'dart:io';

class CoinGecko {
  Future<List<Map<String,dynamic>>> markets({String vs='usd', int perPage=50, int page=1, bool sparkline=true}) async {
    final uri = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=$vs&order=market_cap_desc&per_page=$perPage&page=$page&sparkline=$sparkline&price_change_percentage=24h');
    final client = HttpClient();
    final req = await client.getUrl(uri);
    final res = await req.close();
    final body = await res.transform(utf8.decoder).join();
    final data = jsonDecode(body) as List;
    return data.cast<Map<String,dynamic>>();
  }

  Future<List<Map<String,dynamic>>> statusUpdates() async {
    final uri = Uri.parse('https://api.coingecko.com/api/v3/status_updates');
    final client = HttpClient();
    final req = await client.getUrl(uri);
    final res = await req.close();
    final body = await res.transform(utf8.decoder).join();
    final data = jsonDecode(body) as Map<String, dynamic>;
    final list = data['status_updates'] as List? ?? [];
    return list.cast<Map<String,dynamic>>();
  }
}
