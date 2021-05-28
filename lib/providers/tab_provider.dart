import 'package:flutter/material.dart';

import '../util/tabs_items_list.dart';

class TabBarProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Map<String, Object>> _tabs = tabsItems;

  void setScaffoldKey(value) {
    scaffoldKey = value;
    notifyListeners();
  }

  List<Map<String, Object>> get tabs {
    return [..._tabs];
  }
}
