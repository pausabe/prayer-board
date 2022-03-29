import 'package:flutter/material.dart';
import '../../../models/prayer.dart';

class PrayerList extends StatelessWidget {
  const PrayerList({Key? key, required this.prayers}) : super(key: key);
  final List<Prayer> prayers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prayers.length,
      itemBuilder: (context, index) {
        final prayerDescription = Text(prayers[index].description);
        return ListTile(
            title: prayerDescription
        );
      },
    );
  }
}