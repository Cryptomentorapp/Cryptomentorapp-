import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'llm_service.dart';
import 'ai_cache.dart';

class AcademyAI{
  Map<String,dynamic>? _data;
  Map<String,dynamic>? _gloss;
  final LLMService? llm;
  final AICache _cache=AICache();
  AcademyAI({this.llm});

  Future<void> init() async {
    await _cache.load();
    _data=jsonDecode(await rootBundle.loadString('assets/academy/lessons.json'));
    _gloss=jsonDecode(await rootBundle.loadString('assets/academy/glossary.json'));
  }

  Future<Map<String,dynamic>> ask(String q) async {
    q=q.trim();
    final cached=await _cache.get(q,scope:'academy');
    if(cached!=null){
      return {"context":<Map<String,String>>[],"glossary":<Map<String,dynamic>>[],"answer":cached};
    }

    final ql=q.toLowerCase();
    final List<Map<String,String>> ctx=[];
    final List<Map<String,dynamic>> gloss=[];

    final levels=(_data?["levels"] as List).cast<Map>();
    for(final lvl in levels){
      final lessons=(lvl["lessons"] as List).cast<Map>();
      for(final l in lessons){
        final title=(l["title"]??"").toString();
        final content=(l["content"]??"").toString();
        if(title.toLowerCase().contains(ql)||content.toLowerCase().contains(ql)){
          final ex=content.substring(0, content.length>300?300:content.length);
          ctx.add({"title":title,"excerpt":ex});
          if(ctx.length>=5) break;
        }
      }
    }

    final terms=(_gloss?["terms"] as List).cast<Map>();
    for(final t in terms){
      final term=(t["term"]??"").toString();
      if(term.toLowerCase().contains(ql)){
        gloss.add(Map<String,dynamic>.from(t));
        if(gloss.length>=5) break;
      }
    }

    final answer="Tóm tắt offline: ${ctx.length} bài liên quan, ${gloss.length} thuật ngữ.";
    await _cache.put(q,answer,scope:'academy');

    return {"context": ctx, "glossary": gloss, "answer": answer};
  }
}