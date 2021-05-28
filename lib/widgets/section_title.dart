import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({
    @required this.title,
    @required this.tapHandler,
  });

  final String title;
  final Function tapHandler;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.raleway(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          onPressed: tapHandler,
          iconSize: 16,
          padding: const EdgeInsets.all(0),
          icon: Icon(LineariconsFree.chevron_right),
        ),
      ],
    );
  }
}
