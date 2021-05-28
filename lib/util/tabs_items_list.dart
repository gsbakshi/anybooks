import '../pages/favourite_books_screen.dart';
import '../pages/favourite_genres_screen.dart';

final List<Map<String, Object>> tabsItems = [
  {
    'label': 'Genres',
    'page': FavouriteGenres(),
  },
  {
    'label': 'Books',
    'page': FavouriteBooks(),
  },
];
