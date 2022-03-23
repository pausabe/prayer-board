import 'package:flutter/material.dart';

class PrayerBoardAppBar extends StatefulWidget implements PreferredSizeWidget {
  const PrayerBoardAppBar({Key? key, required this.title}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);
  final String title;

  @override
  final Size preferredSize;

  @override
  _PrayerBoardAppBar createState() => _PrayerBoardAppBar();
}

class _PrayerBoardAppBar extends State<PrayerBoardAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar( title: Text(widget.title) );
  }
}