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
    textFieldController.text = prayer.description;
    return Dismissible(
      key: UniqueKey(),

      // only allows the user swipe from right to left
      direction: DismissDirection.endToStart,

      // Remove this Prayer from the list
      onDismissed: (_) {
        HomePageController.getInstance().removePrayer(index);
      },

      // Prayer Item
      child: TextField(
        keyboardType: TextInputType.text,
        autofocus: true,
        textInputAction: TextInputAction.done,
        controller: textFieldController,
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (value) {
          HomePageController.getInstance().savePrayer(index, value);
        }
      ),

      // This will show up when the user performs dismissal action
      background: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}