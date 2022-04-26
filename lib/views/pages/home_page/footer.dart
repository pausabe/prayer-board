import 'package:flutter/material.dart';
import '../../../controllers/home_page/home_page_controller.dart';
import '../../../services/language_service.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var language = LanguageService.getInstance().currentLanguage;

    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey,
      ),
      onPressed: () => HomePageController.getInstance().createEmptyPrayer(),
      child: Text(language.newPrayerButton,
          style: Theme.of(context).textTheme.bodyText2),
    );
  }
}