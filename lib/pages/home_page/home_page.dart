import 'package:flutter/material.dart';
import 'package:prayerboard/services/prayer_manager/prayer_manager_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _listOfPrayers(){
    var prayerManagerService = PrayerManagerService();
    var prayers = prayerManagerService.getPrayers();
    var prayerWidgets = prayers.map((prayer) => Text(prayer.description)).toList();
    return prayerWidgets;
  }

  @override
  Widget build(BuildContext context) {
    var prayerDescriptions = _listOfPrayers();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: prayerDescriptions.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final prayerDescription = prayerDescriptions[index];
          return ListTile(
            title: prayerDescription
          );
        },
      ),

      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _listOfPrayers(),
        ),
      ),*/
    );
  }
}