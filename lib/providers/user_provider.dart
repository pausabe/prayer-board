import 'package:flutter/material.dart';
import '../models/prayer.dart';

class UserProvider extends ChangeNotifier {
  late List<Prayer> _userPrayers = [];
  List<Prayer> get userPrayers => _userPrayers;
  set userPrayers(List<Prayer> userPrayers) {
    _userPrayers = userPrayers;
    int numberOfPrayers = userPrayers.length;
    print('notify: $numberOfPrayers');
    notifyListeners();
  }
}