import 'package:flutter/material.dart';
import 'package:prayerboard/services/language/language_service.dart';
import 'package:prayerboard/services/persistent_data/persistent_data_service.dart';
import 'views/pages/home_page/home_page.dart';
import 'providers/user_provider.dart';
import 'services/user_service.dart';
import 'package:provider/provider.dart';
import 'controllers/base_controller.dart' as controllers;

void main() {
  runApp(const MyApp());
  //final persistentDataService = PersistentDataService.getInstance();
  //persistentDataService.clearCache();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODO: why is this initialization necessary?
        ChangeNotifierProvider(create: (c) => UserProvider()),
        Provider(create: (c) => UserService()),
      ],
      child: Builder(builder: (context) {
        controllers.init(context);
        var language = LanguageService.getInstance().getCurrentLanguage();
        return MaterialApp(home: HomePage(title: language.appTitle));
      }),
    );
  }
}
