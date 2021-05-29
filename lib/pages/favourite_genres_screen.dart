import 'package:anybooks/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteGenres extends StatelessWidget {
  static const routeName = '/favourite-genres';

  @override
  Widget build(BuildContext context) {
    final genres = Provider.of<BooksProvider>(context).genres;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        spacing: 16,
        children: genres
            .map(
              (genre) => GenreItem(genre),
            )
            .toList(),
      ),
    );
  }
}

class GenreItem extends StatefulWidget {
  GenreItem(this.genre);
  final Map<String, Object> genre;

  @override
  _GenreItemState createState() => _GenreItemState();
}

class _GenreItemState extends State<GenreItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      onSelected: (value) {
        setState(() {
          _isSelected = value;
        });
      },
      selected: _isSelected,
      avatar: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.5),
        child: Text(
          (widget.genre['title'] as String)[6],
          style: TextStyle(color: Colors.white),
        ),
      ),
      label: Text(
        widget.genre['title'],
      ),
    );
  }
}
