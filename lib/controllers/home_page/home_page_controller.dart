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
    addEmptyPrayer();
  }

  // Returns the new prayer index in the prayer list
  int addEmptyPrayer() {
    var currentPrayers = userProvider.userPrayers;
    var newPrayer = Prayer(description: "");
    currentPrayers.add(newPrayer);
    userProvider.userPrayers = currentPrayers;
    return currentPrayers.length - 1;
  }

  Future<void> savePrayer(int prayerIndex, String description) async {
    var currentPrayers = userProvider.userPrayers;
    if(currentPrayers.length > prayerIndex){
      currentPrayers[prayerIndex].description = description;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('prayers', jsonEncode(currentPrayers));
    }
  }
}