import 'package:flutter/material.dart';

import '../util/navigator_items_list.dart';

class NavigatorProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _controller;

  int _index = 0;

  List<Map<String, Object>> _pages = navigatorItems;

  void setScaffoldKey(value) {
    scaffoldKey = value;
    notifyListeners();
  }

  List<Map<String, Object>> get pages {
    return [..._pages];
  }

  int get index {
    return _index;
  }

  PageController get controller {
    return _controller;
  }

  set index(value) {
    _index = value;
    notifyListeners();
  }

  void pageChange(int value) {
    _index = value;
    notifyListeners();
  }
}
