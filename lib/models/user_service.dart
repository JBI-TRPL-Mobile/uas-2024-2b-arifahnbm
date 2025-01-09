import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class UserService {
  static Future<List<Map<String, String>>?> loadUserData() async {
    try {
      String jsonString = await rootBundle.loadString('Data/user.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((user) => Map<String, String>.from(user)).toList();
    } catch (e) {
      print('Gagal membaca data: $e');
      return null;
    }
  }

  static Future<bool> verifyLogin(String email, String password) async {
    try {
      final usersData = await loadUserData();
      if (usersData != null) {
        for (var user in usersData) {
          if (user['email'] == email && user['password'] == password) {
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      print('Error selama verifikasi: $e');
      return false;
    }
  }
}