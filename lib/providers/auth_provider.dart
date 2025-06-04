import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool get isAuth => _user != null;
  User? get user => _user;

  Future<void> signup(String email, String password, String name) async {
    // TODO: Implement actual signup logic with backend
    _user = User(
      id: DateTime.now().toString(),
      email: email,
      name: name,
    );
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // TODO: Implement actual login logic with backend
    _user = User(
      id: DateTime.now().toString(),
      email: email,
      name: 'User',
    );
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    // TODO: Implement auto login with stored credentials
    return false;
  }
} 