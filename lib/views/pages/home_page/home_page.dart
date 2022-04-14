import 'package:flutter/material.dart';
import 'package:prayerboard/controllers/home_page/home_page_controller.dart';
import 'package:prayerboard/views/components/prayer_board_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../controllers/home_page/home_page_controller.dart';
import '../../../models/prayer.dart';
import '../../../providers/user_provider.dart';
import 'footer.dart';
import 'prayer_list.dart';

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
    // TODO: is this HomePageController is a unique instance?
    HomePageController().setSavedUserPrayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to UserProvider
    Provider.of<UserProvider>(context);

    var prayers = context.select<UserProvider, List<Prayer>>((value) => value.userPrayers);

    return Scaffold(
      appBar: PrayerBoardAppBar(title: widget.title),
      body: SafeArea(
        child: Column(
          children:  <Widget>[
            Expanded(
              child: PrayerList(prayers: prayers)
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}