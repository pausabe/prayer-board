import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';

BuildContext _mainContext;
void init(BuildContext c) => _mainContext = c;

class BaseCommand {
  // Models
  UserProvider userProvider = _mainContext.read();
  // Services
  UserService userService = _mainContext.read();
}