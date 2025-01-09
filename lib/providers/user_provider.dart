import 'package:flutter/material.dart';
import 'package:template_project/Models/user_service.dart';

class UserProvider with ChangeNotifier {
  List<Map<String, String>> _users = [];
  String? _name;
  String? _email;
  String? _password;

  List<Map<String, String>> get users => _users;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;

  Future<void> loadUsers() async {
    final users = await UserService.loadUserData();
    if (users != null) {
      _users = users;
      notifyListeners();
    }
  }

  bool isAuthenticated() {
    return _email != null && _password != null;
  }

  Future<bool> login(String email, String password) async {
    bool success = await UserService.verifyLogin(email, password);
    if (success) {
      _name = name;
      _email = email;
      _password = password;
      notifyListeners();
    }
    return success;
  }
}