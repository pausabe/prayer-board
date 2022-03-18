import 'models/prayer.dart';

class PrayerManagerService{

  // Singleton Pattern
  static final PrayerManagerService _instance =
    PrayerManagerService._privateConstructor();
  factory PrayerManagerService() => _instance;
  PrayerManagerService._privateConstructor();

  final _prayers = <Prayer>[];

  void loadPrayers(){
    // TODO: Load from cache

    var prayer1 = Prayer();
    prayer1.description = "...World Peace";
    var prayer2 = Prayer();
    prayer2.description = "...Poverty";
    _prayers.add(prayer1);
    _prayers.add(prayer2);
  }

  List<Prayer> getPrayers(){
    return _prayers;
  }
}