
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';
class ApiClient {
  final String baseUrl;
  ApiClient(): baseUrl = AppConfig.baseUrl;
  Future<Map<String, dynamic>> getJson(String path, {Map<String, String>? query}) async {
    final uri = Uri.parse("$baseUrl$path").replace(queryParameters: query);
    final res = await http.get(uri, headers: {'Accept':'application/json'});
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    throw Exception('HTTP ${res.statusCode}: ${res.body}');
  }
}
