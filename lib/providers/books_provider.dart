import 'package:anybooks/util/api.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
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

  CategoryFeed top = CategoryFeed();
  CategoryFeed recent = CategoryFeed();
  List _genres = [];
  Api api = Api();

  getFeeds() async {
    try {
      CategoryFeed popular = await api.getCategory(Api.popular);
      setTop(popular);
      CategoryFeed newReleases = await api.getCategory(Api.recent);
      setRecent(newReleases);
    } catch (e) {
      throw (e);
    }
  }

  getGenres(String url) async {
    try {
      CategoryFeed feed = await api.getCategory(url);
      _genres = feed.feed.entry;
    } catch (e) {
      throw (e);
    }
  }

  void setTop(value) {
    top = value;
    notifyListeners();
  }

  CategoryFeed getTop() {
    return top;
  }

  void setRecent(value) {
    recent = value;
    notifyListeners();
  }

  CategoryFeed getRecent() {
    return recent;
  }
}
