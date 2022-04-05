import 'package:flutter/material.dart';
import '../../../controllers/home_page/home_page_controller.dart';
import '../../../models/prayer.dart';

class PrayerItemList extends StatelessWidget {
  const PrayerItemList({Key? key, required this.index, required this.prayer}) : super(key: key);
  final int index;
  final Prayer prayer;

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    // TODO: do i have to dispose textFieldController?
    textFieldController.text = prayer.description;
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: true,
      textInputAction: TextInputAction.done,
      controller: textFieldController,
      onEditingComplete: () {
        HomePageController().savePrayer(index, textFieldController.text);
      },
    );
  }
}