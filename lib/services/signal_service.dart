
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/signal.dart';

Future<List<Signal>> loadSignals() async {
  final raw = await rootBundle.loadString('assets/json/signals.json');
  final list = (jsonDecode(raw) as List).cast<Map<String,dynamic>>();
  return list.map((e)=>Signal.fromJson(e)).toList();
}
