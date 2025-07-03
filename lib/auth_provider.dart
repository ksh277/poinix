import 'package:flutter/material.dart';
import 'auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _service = AuthService();
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  Future<void> login(String email, String password) async {
    await _service.login(email, password);
    _loggedIn = true;
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    await _service.signup(email, password);
    _loggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _service.logout();
    _loggedIn = false;
    notifyListeners();
  }
}
