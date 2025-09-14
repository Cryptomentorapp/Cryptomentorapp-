import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';
class Api { static Future<dynamic> get(String p,{Map<String,String>? q}) async { final u=Uri.parse('${AppConfig.baseUrl}$p').replace(queryParameters:q); final r=await http.get(u); if(r.statusCode>=200&&r.statusCode<300)return jsonDecode(r.body); throw Exception('HTTP ${r.statusCode}: ${r.body}'); } }
