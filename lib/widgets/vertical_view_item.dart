import 'package:flutter/material.dart';

import '../pages/book_details_screen.dart';

class VerticalViewItem extends StatelessWidget {
  VerticalViewItem(this.book);

  final Map<String, Object> book;

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: GestureDetector(
        onTap: () {
          print(book['title']);
          Navigator.of(context)
              .pushNamed(BookDetailsScreen.routeName, arguments: book['id']);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: query.width * 0.24,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    book['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book['title'],
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 12),
                        child: Text(
                          book['author'],
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book['description'],
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
