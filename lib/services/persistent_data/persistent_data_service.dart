import 'i_persistent_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentDataService implements IPersistentDataService {
  PersistentDataService._private();
  static final PersistentDataService _instance = PersistentDataService._private();
  static PersistentDataService getInstance() => _instance;

  @override
  Future<String> getJson(String? key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String valueString = sharedPreferences.getString(key ?? "") ?? "";
    return valueString;
  }

  @override
  Future<void> clearCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}