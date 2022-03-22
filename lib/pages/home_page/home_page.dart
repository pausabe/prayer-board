import 'package:flutter/material.dart';
import 'package:prayerboard/controllers/home_page/home_page_controller.dart';
import 'package:prayerboard/providers/user_provider.dart';
import '../../controllers/home_page/home_page_controller.dart';
import '../../models/prayer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Run prayer refresh to build the page again when model is filled
    // TODO: this HomePageController is a unique instance?
    HomePageController().refreshUserPrayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prayers = context.select<UserProvider, List<Prayer>>((value) => value.userPrayers);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: prayers.length,
        itemBuilder: (context, index) {
          final prayerDescription = Text(prayers[index].description);
          return ListTile(
              title: prayerDescription
          );
        },
      )
    );
  }

}