import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiResult<T> { final T? data; final String? error; ApiResult({this.data,this.error}); bool get ok => data!=null && error==null; }
class FreeApis {
  static const coingecko = "https://api.coingecko.com/api/v3";
  static Future<ApiResult<List<dynamic>>> marketTop() async {
    try {
      final uri = Uri.parse("$coingecko/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false");
      final res = await http.get(uri);
      if (res.statusCode==200) return ApiResult(data: json.decode(res.body) as List<dynamic>);
      return ApiResult(error: "HTTP ${res.statusCode}");
    } catch (e) { return ApiResult(error: e.toString()); }
  }
  static Future<ApiResult<Map<String,dynamic>>> global() async {
    try {
      final res = await http.get(Uri.parse("$coingecko/global"));
      if (res.statusCode==200) return ApiResult(data: json.decode(res.body) as Map<String,dynamic>);
      return ApiResult(error: "HTTP ${res.statusCode}");
    } catch (e) { return ApiResult(error: e.toString()); }
  }
}