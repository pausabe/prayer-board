import 'package:flutter/material.dart';
import '../../../controllers/home_page/home_page_controller.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey,
      ),
      onPressed: () => HomePageController().openPrayerEditor(),
      child: const Text('New Prayer'),
    );
  }
}