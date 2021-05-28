import 'package:anybooks/providers/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavigatorScreen extends StatelessWidget {
  static const routeName = '/navigator';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigatorProvider>(
      builder: (BuildContext ctx, NavigatorProvider nav, _) => Scaffold(
        key: nav.scaffoldKey,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: nav.index != nav.pages.length - 1
              ? Text(
                  nav.pages[nav.index]['label'],
                  style: GoogleFonts.parisienne(fontSize: 28),
                )
              : const Text(''),
          toolbarHeight: nav.index != nav.pages.length - 1
              ? kToolbarHeight * 1.2
              : kToolbarHeight * 0.6,
          actions: nav.pages[nav.index]['action'] != null
              ? (nav.pages[nav.index]['action'] as List<Widget>)
              : [],
        ),
        body: nav.pages[nav.index]['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 6,
          type: BottomNavigationBarType.fixed,
          currentIndex: nav.index,
          onTap: nav.pageChange,
          selectedItemColor: Colors.white.withOpacity(0.5),
          unselectedItemColor: Colors.white.withOpacity(0.2),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: nav.pages
              .map(
                (item) => BottomNavigationBarItem(
                  label: item['label'],
                  icon: Icon(item['icon']),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
