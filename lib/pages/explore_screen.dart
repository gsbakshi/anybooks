import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

import '../widgets/section_builder.dart';
import '../providers/books_provider.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore';

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ScrollController _controller = ScrollController();
  bool _grid = false;

  @override
  Widget build(BuildContext context) {
    final genres = Provider.of<BooksProvider>(context, listen: false).genres;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _grid = !_grid;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  FontAwesome5.th_large,
                  size: 20,
                  color: Colors.white.withOpacity(0.4),
                ),
                Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 24,
                  color: Colors.white.withOpacity(0.2),
                ),
                Icon(
                  FontAwesome5.list_ul,
                  size: 20,
                  color: Colors.white.withOpacity(0.4),
                ),
              ],
            ),
          ),
        ),
        _grid
            ? Container(
                child: Center(child: Text('a')),
              )
            : Expanded(
                child: ListView.builder(
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: genres.length,
                  itemBuilder: (ctx, i) => SectionBuilder(genres[i]['id']),
                ),
              ),
      ],
    );
  }
}
