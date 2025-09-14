import 'dart:convert';
import 'package:http/http.dart' as http;
class Net {
  static Future<dynamic> getJson(String url) async {
    final res = await http.get(Uri.parse(url), headers: {'User-Agent': 'Cryptomentor/1.0 (Flutter)'});
    if (res.statusCode >= 200 && res.statusCode < 300) return jsonDecode(res.body);
    throw Exception('HTTP ${res.statusCode} for $url');
  }
}
