import '../../models/prayer.dart';
import '../base_controller.dart';

class HomePageController extends BaseController {
  Future<void> refreshUserPrayers() async {
    print("refreshUserPrayers");
    List<Prayer> prayers = await userService.getPrayers();
    userProvider.userPrayers = prayers;
  }

  void openPrayerEditor(){
    // TODO: implement correctly opening an editor

    var currentPrayers = userProvider.userPrayers;
    var newPrayer = Prayer();
    newPrayer.description = "Faith";
    currentPrayers.add(newPrayer);
    userProvider.userPrayers = currentPrayers;
  }
}