import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tab_provider.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = '/favourites';

  @override
  Widget build(BuildContext context) {
    return Consumer<TabBarProvider>(
      builder: (BuildContext ctx, TabBarProvider tabs, _) =>
          DefaultTabController(
        length: tabs.tabs.length,
        child: Scaffold(
          key: tabs.scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 32,
            title: Container(
              padding: const EdgeInsets.all(2.4),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(kToolbarHeight / 2),
              ),
              child: TabBar(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kToolbarHeight / 2,
                  ),
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.8),
                ),
                tabs: tabs.tabs
                    .map(
                      (tab) => Tab(
                        child: Text(tab['label']),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: tabs.tabs
                .map(
                  (tab) => (tab['page'] as Widget),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
