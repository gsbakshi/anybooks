import 'package:anybooks/widgets/horizontal_view_item.dart';
import 'package:flutter/material.dart';

class FavouriteBooks extends StatelessWidget {
  static const routeName = '/favourite-books';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 24,
        // childAspectRatio: 3 / 2,
        mainAxisExtent: 240,
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 64),
      itemCount: 18,
      itemBuilder: (ctx, i) => HorizontalViewItem(
        {
          'id': '1',
          'title': 'Title',
          'author': 'Author',
          'image':
              'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
          'saved': true,
        },
      ),
    );
  }
}
