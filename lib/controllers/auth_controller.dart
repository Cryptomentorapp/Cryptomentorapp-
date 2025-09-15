import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  bool _authed = false;
  String? _email;
  bool get isAuthed => _authed;
  String? get email => _email;

  static const _demoUser = 'admin';
  static const _demoPass = 'admin';

  Future<bool> login(String user, String pass) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (user.trim() == _demoUser && pass == _demoPass) {
      _authed = true;
      _email = 'admin@cryptomentor.local';
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout(){ _authed=false; _email=null; notifyListeners(); }
}
