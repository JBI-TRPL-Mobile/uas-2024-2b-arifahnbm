import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/user.dart';
import '../models/message.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<Message> _messages = [];
  User? _currentUser;

  User? get currentUser => _currentUser;
  List<Message> get messages => _messages;

  Future<void> loadUsers() async {
    final String response = await rootBundle.loadString('assets/data/datauser.json');
    final data = json.decode(response) as List;
    _users = data.map((user) => User.fromJson(user)).toList();
    notifyListeners();
  }

  Future<void> loadMessages() async {
    final String response = await rootBundle.loadString('assets/data/datamessage.json');
    final data = json.decode(response) as List;
    _messages = data.map((msg) => Message.fromJson(msg)).toList();
    notifyListeners();
  }

  void signIn(String name) {
    _currentUser = _users.firstWhere((user) => user.name == name, orElse: () => User(id: -1, name: '')); // Dummy user jika tidak ditemukan
    notifyListeners();
  }

  void signUp(String name) {
    final newUser = User(id: _users.length + 1, name: name);
    _users.add(newUser);
    _currentUser = newUser;
    notifyListeners();
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}