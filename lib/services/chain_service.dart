import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ChainService{
  static Future<String> balanceETH(String address) async {
    final u = Uri.parse('${CMConfig.etherscanBase}?module=account&action=balance&address=$address&tag=latest&apikey=${CMConfig.etherscanKey}');
    final r = await http.get(u);
    if(r.statusCode==200){ final m = jsonDecode(r.body); return (m['result']??'-').toString(); }
    throw Exception('HTTP ${r.statusCode}');
  }
  static Future<String> balanceBSC(String address) async {
    final u = Uri.parse('${CMConfig.bscscanBase}?module=account&action=balance&address=$address&tag=latest&apikey=${CMConfig.bscscanKey}');
    final r = await http.get(u);
    if(r.statusCode==200){ final m = jsonDecode(r.body); return (m['result']??'-').toString(); }
    throw Exception('HTTP ${r.statusCode}');
  }
}