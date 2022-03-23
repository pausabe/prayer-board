import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/prayer.dart';
import '../../../providers/user_provider.dart';

class PrayerList extends StatelessWidget {
  const PrayerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prayers = context.select<UserProvider, List<Prayer>>((value) => value.userPrayers);
    int prayerLength = prayers.length;
    print('prayer list build: $prayerLength');
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