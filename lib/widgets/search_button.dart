import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

class SearchButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Linecons.search),
      ),
    );
  }
}