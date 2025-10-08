import 'package:flutter/services.dart' show rootBundle;

class KnowledgeService {
  static Future<List<Map<String,String>>> loadCorpus() async {
    final files = [
      'assets/knowledge/academy_foundation.md',
      'assets/knowledge/academy_ta_core.md',
      'assets/knowledge/scanner_rules.json',
      'assets/knowledge/signals_strategies.md',
      'assets/knowledge/whales_patterns.md',
      'assets/knowledge/research_templates.md',
    ];
    final List<Map<String,String>> docs = [];
    for (final p in files) {
      final s = await rootBundle.loadString(p);
      docs.add({'path': p, 'content': s});
    }
    return docs;
  }
}
