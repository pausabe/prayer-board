import 'package:flutter/material.dart';
import 'package:prayerboard/controllers/theme_controller.dart';
import 'package:prayerboard/providers/theme_provider.dart';
import 'package:prayerboard/services/language_service.dart';
import 'views/pages/home_page/home_page.dart';
import 'providers/user_provider.dart';
import 'services/user_service.dart';
import 'package:provider/provider.dart';
import 'controllers/base_controller.dart' as controllers;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> initializationAsync() async {
    // Set here all the async initialization before starting the app
    await LanguageService.getInstance().setInitialLanguage();
    await ThemeController.getInstance().setInitialTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => ThemeProvider()),
        ChangeNotifierProvider(create: (c) => UserProvider()),
        Provider(create: (c) => UserService())
      ],
      child: FutureBuilder<void>(
          future: initializationAsync(),
          builder: (context, snapshot) {
            controllers.init(context);
            if (snapshot.connectionState == ConnectionState.done) {
              var language = LanguageService.getInstance().currentLanguage;
              return MaterialApp(
                home: HomePage(title: language.appTitle),
                theme: Provider.of<ThemeProvider>(context).currentTheme,
              );
            }
            else{
              return Container();
            }
      }),
    );
  }
}
