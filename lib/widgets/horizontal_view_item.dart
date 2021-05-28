import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';

import '../pages/book_details_screen.dart';

class HorizontalViewItem extends StatefulWidget {
  HorizontalViewItem(this.book);

  final Map<String, Object> book;

  @override
  _HorizontalViewItemState createState() => _HorizontalViewItemState();
}

class _HorizontalViewItemState extends State<HorizontalViewItem> {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              print(widget.book['title']);
              Navigator.of(context).pushNamed(BookDetailsScreen.routeName,
                  arguments: widget.book['id']);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  widget.book['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: query.width * 0.137,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(widget.book['title']),
            subtitle: Text(widget.book['author']),
            trailing: IconButton(
              onPressed: () {
                print('Bookmark');
                setState(() {
                  widget.book['saved'] = !widget.book['saved'];
                });
              },
              padding: const EdgeInsets.only(right: 12),
              icon: widget.book['saved'] as bool
                  ? Icon(Elusive.bookmark)
                  : Icon(Elusive.bookmark_empty),
            ),
          ),
        ),
      ],
    );
  }
}
