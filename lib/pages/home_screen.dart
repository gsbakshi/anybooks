import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books_provider.dart';

import '../widgets/section_builder.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final sections =
        Provider.of<BooksProvider>(context, listen: false).sections;
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (ctx, i) => SectionBuilder(sections[i]['id']),
    );
  }
}
