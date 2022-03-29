import '../../models/prayer.dart';
import '../base_controller.dart';

class HomePageController extends BaseController {
  Future<void> refreshUserPrayers() async{
    List<Prayer> prayers = await userService.getPrayers();
    userProvider.userPrayers = prayers;
  }

  void createEmptyPrayer() {
    addEmptyPrayer();
    //TODO: focusToNewPrayer();
  }

  // Returns the new prayer index in the prayer list
  int addEmptyPrayer() {
    var currentPrayers = userProvider.userPrayers;
    var newPrayer = Prayer();
    newPrayer.description = "";
    currentPrayers.add(newPrayer);
    userProvider.userPrayers = currentPrayers;
    return currentPrayers.length - 1;
  }
}