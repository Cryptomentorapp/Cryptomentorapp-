
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Map<String, dynamic>>> loadNews() async {
  final raw = await rootBundle.loadString('assets/json/news.json');
  final data = jsonDecode(raw) as List;
  return data.cast<Map<String, dynamic>>();
}
