import 'package:flutter/material.dart';

class SectionListScreen extends StatelessWidget {
  static const routeName = '/section-list';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Section List Screen'),
        ),
      ),
    );
  }
}
