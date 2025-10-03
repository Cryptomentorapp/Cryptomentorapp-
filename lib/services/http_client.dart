import 'dart:convert';
import 'package:http/http.dart' as http;
class HttpClientX {
  static Future<Map<String,dynamic>> getMap(Uri url) async {
    final r = await http.get(url).timeout(const Duration(seconds: 15));
    if (r.statusCode >= 200 && r.statusCode < 300) {
      return (json.decode(r.body) as Map<String,dynamic>);
    }
    throw Exception('HTTP ${r.statusCode}: ${r.body}');
  }
  static Future<List<dynamic>> getList(Uri url) async {
    final r = await http.get(url).timeout(const Duration(seconds: 15));
    if (r.statusCode >= 200 && r.statusCode < 300) {
      return (json.decode(r.body) as List);
    }
    throw Exception('HTTP ${r.statusCode}: ${r.body}');
  }
}
