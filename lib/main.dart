import 'package:flutter/material.dart';
import 'pages/home_page/home_page.dart';
import 'services/start_service.dart';
import 'providers/user_provider.dart';
import 'services/user_service.dart';
import 'package:provider/provider.dart';
import 'commands/base_command.dart' as Commands;

void main() {
  runApp(const MyApp());
  var startService = StartService();
  startService.actionsAfterAppStart();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => UserProvider()),
        Provider(create: (c) => UserService()),
      ],
      child: Builder(builder: (context) {
        Commands.init(context);
        return const MaterialApp(home: MyHomePage(title: "Prayer Board"));
      }),
    );
  }
}
