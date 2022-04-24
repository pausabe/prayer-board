import 'dart:convert';
import '../../models/prayer.dart';
import '../../services/persistent_data/persistent_data_service.dart';
import '../base_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/persistent_data/persistent_data_keys.dart' as persistent_data_keys;

class HomePageController extends BaseController {
  Future<void> setSavedUserPrayers() async {
    userProvider.userPrayers = await userService.getPrayers();
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
    await PersistentDataService.getInstance().saveValue(persistent_data_keys.prayersJson,
        jsonEncode(prayers));
  }
}