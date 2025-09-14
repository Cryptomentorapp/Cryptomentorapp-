
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';
class Api {
  static Future<dynamic> get(String path,{Map<String,String>? query}) async {
    final uri = Uri.parse('${AppConfig.baseUrl}$path').replace(queryParameters: query);
    final r = await http.get(uri, headers: {'Accept':'application/json'});
    if (r.statusCode>=200 && r.statusCode<300) return jsonDecode(r.body);
    throw Exception('HTTP ${r.statusCode}: ${r.body}');
  }
}
