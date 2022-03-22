import '../../models/prayer.dart';
import '../base_controller.dart';

class HomePageController extends BaseController {
  Future<List<Prayer>> refreshUserPrayers() async {
    List<Prayer> prayers = await userService.getPrayers();
    userProvider.userPrayers = prayers;
    return prayers;
  }
}