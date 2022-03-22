import '../../models/prayer.dart';

class UserService {
  Future<List<Prayer>> getPrayers() async {

    // TODO: Load from cache

    var prayer1 = Prayer();
    prayer1.description = "...World Peace";
    var prayer2 = Prayer();
    prayer2.description = "...Poverty";
    var prayers = <Prayer>[];
    prayers.add(prayer1);
    prayers.add(prayer2);

    return prayers;
  }
}