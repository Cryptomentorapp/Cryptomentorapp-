import 'http_client.dart';
class CoingeckoService {
  static Future<List<dynamic>> markets() => HttpClientX.getList(Uri.parse(
    'https://api.coingecko.com/api/v3/coins/markets'
    '?vs_currency=usd&order=market_cap_desc&per_page=100&page=1'
    '&sparkline=false&price_change_percentage=24h'
  ));
}
