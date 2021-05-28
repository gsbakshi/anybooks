import 'package:flutter/material.dart';

import '../util/home_sections_list.dart';
import '../util/explore_sections_list.dart';

class BooksProvider extends ChangeNotifier {
  List<Map<String, Object>> _sections = [];

  List<Map<String, Object>> get sections {
    _sections = homeSections;
    return [..._sections];
  }

  List<Map<String, Object>> get genres {
    _sections = exploreSections;
    return [..._sections];
  }

  Map<String, Object> findById(String id) {
    return _sections.firstWhere((section) => section['id'] == id);
  }
}
