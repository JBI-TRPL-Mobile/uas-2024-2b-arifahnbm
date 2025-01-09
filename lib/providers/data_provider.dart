import 'package:flutter/material.dart';
import 'package:template_project/models/data_service.dart';

class DataProvider with ChangeNotifier {
  List<String> _categories = [];

  List<String> get categories => _categories;

  Future<void> loadCategories() async {
    _categories = await DataService.loadCategories();
    notifyListeners();
  }
}