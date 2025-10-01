import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class NewsRepo {
  Future<List<Map<String, dynamic>>> list() async {
    try {
      final r = await http.get(Uri.parse('https://cryptopanic.com/api/v1/posts/?public=true')).timeout(const Duration(seconds: 12));
      if (r.statusCode == 200) {
        final j = json.decode(r.body) as Map<String, dynamic>;
        final res = (j['results'] as List?) ?? <dynamic>[];
        return res.cast<Map<String,dynamic>>();
      }
      throw Exception('HTTP ${r.statusCode}');
    } catch (_) {
      final txt = await rootBundle.loadString('assets/data/news_stub.json');
      return (json.decode(txt) as List).cast<Map<String,dynamic>>();
    }
  }
}
