import '../services/prayer_manager/prayer_manager_service.dart';

class StartService{

  // Singleton Pattern
  static final StartService _instance =
  StartService._privateConstructor();
  factory StartService() => _instance;
  StartService._privateConstructor();

  void actionsAfterAppStart(){
    var prayerManagerService = PrayerManagerService();
    prayerManagerService.loadPrayers();
  }
}