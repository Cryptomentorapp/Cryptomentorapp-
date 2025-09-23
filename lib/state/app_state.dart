import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool whalesEnabled = true;
  bool premiumEnabled = false;
  List<Map<String, dynamic>> whalesTop50 = [];
  AppState(){ _loadWhales(); }

  Future<void> _loadWhales() async {
    try{
      final data = await rootBundle.loadString('assets/whales_top50.json');
      whalesTop50 = (jsonDecode(data) as List).cast<Map<String, dynamic>>();
      notifyListeners();
    } catch(_){}
  }

  void toggle(String key, bool v){
    if(key=='whales') whalesEnabled = v;
    if(key=='premium') premiumEnabled = v;
    notifyListeners();
  }

  String estimateFee(double amount) {
    final feePct = 0.0018; return (amount * feePct).toStringAsFixed(4);
  }
}