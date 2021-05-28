import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  static const routeName = '/book-details';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Book Details Screen'),
        ),
      ),
    );
  }
}
