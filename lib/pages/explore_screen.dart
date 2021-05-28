import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

import '../util/enums/explore_view.dart';
import '../providers/books_provider.dart';

import '../pages/section_list_screen.dart';

import '../widgets/section_builder.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore';

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideAnimationOut;
  Animation<Offset> _slideAnimationIn;
  Animation<double> _opacityAnimationOut;
  Animation<double> _opacityAnimationIn;

  ExploreView _view = ExploreView.Grid;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    _slideAnimationOut = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-1.5, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _slideAnimationIn = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _opacityAnimationOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _opacityAnimationIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _changeView() {
    if (_view == ExploreView.Grid) {
      setState(() {
        _view = ExploreView.List;
      });
      _controller.forward();
    } else {
      setState(() {
        _view = ExploreView.Grid;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final genres = Provider.of<BooksProvider>(context, listen: false).genres;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: GestureDetector(
            onTap: _changeView,
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: _view == ExploreView.List
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.easeIn,
                    child: FadeTransition(
                      opacity: _opacityAnimationIn,
                      child: SlideTransition(
                        position: _slideAnimationIn,
                        child: ListView.builder(
                          itemCount: genres.length,
                          padding: const EdgeInsets.only(bottom: 64),
                          itemBuilder: (ctx, i) =>
                              SectionBuilder(genres[i]['id']),
                        ),
                      ),
                    ),
                  )
                : AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.easeIn,
                    child: FadeTransition(
                      opacity: _opacityAnimationOut,
                      child: SlideTransition(
                        position: _slideAnimationOut,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                            childAspectRatio: 4 / 2,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: genres.length,
                          itemBuilder: (ctx, i) => GestureDetector(
                            onTap: () {
                              print(genres[i]['title']);
                              Navigator.of(context).pushNamed(
                                SectionListScreen.routeName,
                                arguments: genres[i]['title'],
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(genres[i]['title']),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
