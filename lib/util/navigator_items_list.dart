import 'package:fluttericon/linearicons_free_icons.dart';

import '../pages/explore_screen.dart';
import '../pages/favourites_screen.dart';
import '../pages/home_screen.dart';
import '../pages/settings_screen.dart';

import '../widgets/search_button.dart';

final List<Map<String, Object>> navigatorItems = [
  {
    'label': 'Anybooks',
    'page': HomeScreen(),
    'icon': LineariconsFree.home,
    'action': [
      SearchButton(),
    ],
  },
  {
    'label': 'Explore',
    'page': ExploreScreen(),
    'icon': LineariconsFree.book,
    'action': [
      SearchButton(),
    ],
  },
  {
    'label': 'Favourites',
    'page': FavouritesScreen(),
    'icon': LineariconsFree.bookmark,
  },
  {
    'label': 'Settings',
    'page': SettingsScreen(),
    'icon': LineariconsFree.cog_2,
  },
];
