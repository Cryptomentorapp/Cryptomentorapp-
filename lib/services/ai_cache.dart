import 'dart:convert'; import 'dart:io'; import 'package:path_provider/path_provider.dart';
class AICache { static const _fileName='ai_cache.json'; Map<String,dynamic> _mem={};
  Future<File> _file() async { final dir=await getApplicationDocumentsDirectory(); return File('${dir.path}/$_fileName'); }
  Future<void> load() async { try{ final f=await _file(); if(await f.exists()){ _mem=jsonDecode(await f.readAsString()); } }catch(_){}
  Future<void> save() async { try{ final f=await _file(); await f.writeAsString(jsonEncode(_mem)); }catch(_){}
  String _key(String q,{String scope='global'})=>'$scope::'+q.trim().toLowerCase();
  Future<String?> get(String q,{String scope='global'}) async { if(_mem.isEmpty) await load(); return _mem[_key(q,scope:scope)] as String?; }
  Future<void> put(String q,String ans,{String scope='global'}) async { _mem[_key(q,scope:scope)]=ans; await save(); } }