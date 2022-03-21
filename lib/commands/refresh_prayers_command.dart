import '../models/prayer.dart';
import 'base_command.dart';

class RefreshPrayersCommand extends BaseCommand {
  Future<List<Prayer>> run() async {
    // Make service call and inject results into the model
    List<Prayer> prayers = await userService.getPrayers();
    userProvider.userPrayers = prayers;

    // Return our prayers to the caller in case they care
    return prayers;
  }
}