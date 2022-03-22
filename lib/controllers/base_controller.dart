import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';

late BuildContext _mainContext;
void init(BuildContext c) => _mainContext = c;

class BaseController {
  // Init all necessary classes to use in controllers

  // Providers
  UserProvider userProvider = _mainContext.read();

  // Services
  UserService userService = _mainContext.read();
}