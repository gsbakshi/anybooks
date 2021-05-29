import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:global_configuration/global_configuration.dart';

import 'providers/auth.dart';
import 'providers/tab_provider.dart';
import 'providers/books_provider.dart';
import 'providers/navigator_provider.dart';

import 'pages/home_screen.dart';
import 'pages/explore_screen.dart';
import 'pages/settings_screen.dart';
import 'pages/navigator_screen.dart';
import 'pages/favourites_screen.dart';
import 'pages/section_list_screen.dart';
import 'pages/book_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configurations");
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => NavigatorProvider()),
          ChangeNotifierProvider(create: (ctx) => TabBarProvider()),
          ChangeNotifierProvider(create: (ctx) => BooksProvider()),
          ChangeNotifierProvider(create: (ctx) => Auth()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff191919),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xff191919),
        ),
      ),
      home: NavigatorScreen(),
      routes: {
        NavigatorScreen.routeName: (ctx) => NavigatorScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ExploreScreen.routeName: (ctx) => ExploreScreen(),
        FavouritesScreen.routeName: (ctx) => FavouritesScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        BookDetailsScreen.routeName: (ctx) => BookDetailsScreen(),
        SectionListScreen.routeName: (ctx) => SectionListScreen(),
      },
    );
  }
}
