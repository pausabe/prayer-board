import 'package:flutter/material.dart';
import 'package:prayerboard/views/pages/home_page/prayer_item_list.dart';
import '../../../models/prayer.dart';

class PrayerList extends StatelessWidget {
  const PrayerList({Key? key, required this.prayers}) : super(key: key);
  final List<Prayer> prayers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prayers.length,
      itemBuilder: (context, index) {
        return PrayerItemList(index: index, prayer: prayers[index]);
      },
    );
  }
}