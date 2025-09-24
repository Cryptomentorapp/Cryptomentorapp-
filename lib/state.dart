import 'package:flutter/foundation.dart';
class AppState extends ChangeNotifier{
  bool premium=false;
  bool whalesEnabled=true;
  bool newsEnabled=true;
  void toggle(String key, bool v){
    switch(key){
      case 'premium': premium=v; break;
      case 'whales': whalesEnabled=v; break;
      case 'news': newsEnabled=v; break;
    }
    notifyListeners();
  }
}