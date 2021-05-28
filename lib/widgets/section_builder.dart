import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/enums/books.dart';
import '../providers/books_provider.dart';

import '../pages/section_list_screen.dart';

import 'section_title.dart';
import 'vertical_view_item.dart';
import 'horizontal_view_item.dart';

class SectionBuilder extends StatelessWidget {
  final String itemId;

  SectionBuilder(this.itemId);

  double height(double height, BookItemSize size) {
    switch (size) {
      case BookItemSize.Large:
        return height * 0.47;
      case BookItemSize.Normal:
        return height * 0.36;
      case BookItemSize.Small:
        return height * 1.1;
      default:
        return 320;
    }
  }

  double itemExtent(double width, BookItemSize size) {
    switch (size) {
      case BookItemSize.Large:
        return width * 0.608;
      case BookItemSize.Normal:
        return width * 0.418;
      case BookItemSize.Small:
        return width * 0.484;
      default:
        return 172;
    }
  }

  buildView(double width, Map<String, Object> section) {
    switch (section['view']) {
      case ViewStyle.Horizontal:
        return buildHorizontalView(width, section);
      case ViewStyle.Vertical:
        return buildVerticalView(width, section);
    }
  }

  ListView buildVerticalView(double width, Map<String, Object> section) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemExtent: itemExtent(width, section['size']),
      itemBuilder: (ctx, i) => VerticalViewItem(
        (section['books'] as List)[i],
      ),
    );
  }

  ListView buildHorizontalView(double width, Map<String, Object> section) {
    return ListView.builder(
      itemCount: 4,
      itemExtent: itemExtent(width, section['size']),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => HorizontalViewItem(
        (section['books'] as List)[i],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    final section =
        Provider.of<BooksProvider>(context, listen: false).findById(itemId);
    return Container(
      width: double.infinity,
      height: height(query.height, section['size']),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SectionTitle(
              title: section['title'],
              tapHandler: () {
                print(section['title']);
                Navigator.of(context).pushNamed(SectionListScreen.routeName);
              },
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              width: double.infinity,
              child: buildView(query.width, section),
            ),
          ),
        ],
      ),
    );
  }
}
