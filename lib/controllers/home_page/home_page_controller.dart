import 'dart:convert';
import '../../models/prayer.dart';
import '../base_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends BaseController {
  Future<void> refreshUserPrayers() async{
    List<Prayer> prayers = await userService.getPrayers();
    userProvider.userPrayers = prayers;
  }

  void createEmptyPrayer() {
    _addEmptyPrayer();
  }

  Future<void> savePrayer(int prayerIndex, String description) async {
    var currentPrayers = userProvider.userPrayers;
    if(_indexIsCorrect(currentPrayers, prayerIndex)){
      currentPrayers[prayerIndex].description = description;
      await _savePrayersPersistently(currentPrayers);
    }
  }

  Future<void> removePrayer(int prayerIndex) async {
    var currentPrayers = userProvider.userPrayers;
    if(_indexIsCorrect(currentPrayers, prayerIndex)){
      currentPrayers.removeAt(prayerIndex);
      await _savePrayersPersistently(currentPrayers);
    }
  }

  int _addEmptyPrayer() {
    var currentPrayers = userProvider.userPrayers;
    var newPrayer = Prayer(description: "");
    currentPrayers.add(newPrayer);
    userProvider.userPrayers = currentPrayers;
    return currentPrayers.length - 1;
  }

  bool _indexIsCorrect(List<Prayer> prayers, int index){
    return prayers.length > index;
  }

  Future<void> _savePrayersPersistently(List<Prayer> prayers) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('prayers', jsonEncode(prayers));
  }
}