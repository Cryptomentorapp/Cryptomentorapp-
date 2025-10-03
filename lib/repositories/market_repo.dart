import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../services/coingecko_service.dart';

class MarketRepo {
  Future<List<dynamic>> list() async {
    try {
      final data = await CoingeckoService.markets();
      if (data.isNotEmpty) return data;
      throw Exception('empty');
    } catch (_) {
      final txt = await rootBundle.loadString('assets/data/tokens.json');
      return (json.decode(txt) as List);
    }
  }
}
