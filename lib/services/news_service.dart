import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class NewsItem {
  final String title;
  final String link;
  final String source;
  NewsItem(this.title, this.link, this.source);
}

class NewsService {
  static const _rssCryptoPanic = 'https://cryptopanic.com/rss/';
  static const _rssCoinTelegraph = 'https://cointelegraph.com/rss';
  static Future<List<NewsItem>> fetchRss(String url, String source) async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode != 200) { throw Exception('RSS error $source: ${res.statusCode}'); }
    final doc = xml.XmlDocument.parse(res.body);
    final items = <NewsItem>[];
    for (final item in doc.findAllElements('item')) {
      final title = item.findElements('title').isNotEmpty ? item.findElements('title').first.text : 'No title';
      final link = item.findElements('link').isNotEmpty ? item.findElements('link').first.text : '';
      items.add(NewsItem(title, link, source));
    }
    return items;
  }
  static Future<List<NewsItem>> latest() async {
    final a = await fetchRss(_rssCryptoPanic, 'CryptoPanic');
    final b = await fetchRss(_rssCoinTelegraph, 'CoinTelegraph');
    return [...a, ...b];
  }
}
