import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../services/http_client.dart';

class NewsRepo {
  Future<List<Map<String, dynamic>>> list() async {
    try {
      final j = await HttpClientX.getMap(Uri.parse('https://cryptopanic.com/api/v1/posts/?public=true'));
      final res = (j['results'] as List?) ?? <dynamic>[];
      return res.cast<Map<String,dynamic>>();
    } catch (_) {
      final txt = await rootBundle.loadString('assets/data/news_stub.json');
      return (json.decode(txt) as List).cast<Map<String,dynamic>>();
    }
  }
}
