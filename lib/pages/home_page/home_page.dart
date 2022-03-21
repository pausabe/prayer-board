import 'package:flutter/material.dart';
import 'package:prayerboard/providers/user_provider.dart';
import '../../commands/refresh_prayers_command.dart';
import '../../models/prayer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    RefreshPrayersCommand().run();
    var prayers = context.select<UserProvider, List<Prayer>>((value) => value.userPrayers);
    var prayerDescriptions = prayers.map((prayer) => Text(prayer.description)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: prayerDescriptions.length,
        itemBuilder: (context, index) {
          final prayerDescription = prayerDescriptions[index];
          return ListTile(
            title: prayerDescription
          );
        },
      ),
    );
  }
}