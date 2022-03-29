import 'package:flutter/material.dart';
import '../../../models/prayer.dart';

class PrayerItemList extends StatelessWidget {
  const PrayerItemList({Key? key, required this.prayer}) : super(key: key);
  final Prayer prayer;

  // TODO: save the edited content by user

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    textFieldController.text = prayer.description;
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: true,
      textInputAction: TextInputAction.done,
      controller: textFieldController,
    );
  }
}