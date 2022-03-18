import 'package:flutter/material.dart';
import 'pages/home_page/home_page.dart';
import 'services/start_service.dart';

void main() {
  runApp(const MyApp());
  var startService = StartService();
  startService.actionsAfterAppStart();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Board',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Prayer Board'),
    );
  }
}
