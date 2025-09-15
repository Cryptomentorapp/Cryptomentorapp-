import 'dart:convert';
import 'package:http/http.dart' as http;

class MarketAPI {
  static Future<Map<String, dynamic>> global() async {
    final r = await http.get(Uri.parse('https://api.coingecko.com/api/v3/global'));
    if (r.statusCode != 200) throw Exception('CoinGecko error');
    return (json.decode(r.body) as Map<String,dynamic>)['data'] as Map<String,dynamic>;
  }
  static String usdHuman(num v){
    const unit=['','K','M','B','T']; int i=0; double x=v.toDouble();
    while(x>=1000 && i<unit.length-1){ x/=1000; i++; }
    return '\$'+x.toStringAsFixed(2)+unit[i];
  }
}
