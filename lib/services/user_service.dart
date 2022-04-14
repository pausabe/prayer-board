import 'package:prayerboard/services/persistent_data/persistent_data_service.dart';
import '../../models/prayer.dart';
import './persistent_data/persistent_data_keys.dart' as persistent_data_keys;
import 'dart:convert';

class UserService {
  late final _persistentDataService;

  UserService({PersistentDataService? persistentDataService})
      : _persistentDataService = persistentDataService ?? PersistentDataService.getInstance();

  Future<List<Prayer>> getPrayers() async {
    var prayersJson = await _persistentDataService.getJson(persistent_data_keys.prayers);
    return _prayersFromJson(prayersJson);
  }

  List<Prayer> _prayersFromJson(String prayersJson){
    var prayers = <Prayer>[];
    if(prayersJson.isNotEmpty){
      try {
        prayers = (jsonDecode(prayersJson) as List<dynamic>)
            .map((dynamic jsonObject) => Prayer.fromJson(jsonObject))
            .toList();
      } catch(e) {
        // TODO: log message
      }
    }
    return prayers;
  }
}