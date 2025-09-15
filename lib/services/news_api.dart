import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class NewsItem {
  final String title;
  final String link;
  final String source;
  NewsItem(this.title, this.link, this.source);
}

class NewsAPI {
  static Future<List<NewsItem>> top() async {
    final r = await http.get(Uri.parse('https://cryptopanic.com/rss/'));
    if (r.statusCode != 200) throw Exception('RSS error');
    final doc = XmlDocument.parse(r.body);
    final items = <NewsItem>[];
    for (final item in doc.findAllElements('item').take(20)) {
      final title = item.getElement('title')?.text ?? '...';
      final link = item.getElement('link')?.text ?? '';
      final src = item.getElement('source')?.getAttribute('url') ?? 'CryptoPanic';
      items.add(NewsItem(title, link, src));
    }
    return items;
  }
}
