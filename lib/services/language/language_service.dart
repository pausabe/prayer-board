import '../persistent_data/persistent_data_service.dart';
import 'languages/language_en.dart';
import 'languages/language_base.dart';
import '../persistent_data/persistent_data_keys.dart' as persistent_data_keys;

const String firstTimeLanguageCode = englishCode;
const String englishCode = "en";

class LanguageService {
  LanguageService._private();
  static final LanguageService _instance = LanguageService._private();
  static LanguageService getInstance() =>_instance;

  // ignore: prefer_typing_uninitialized_variables
  var _currentLanguage;
  Languages get currentLanguage => _currentLanguage;

  setInitialLanguage() async {
    var persistentDataService = PersistentDataService.getInstance();
    var currentLanguageCode = await persistentDataService.getValue(persistent_data_keys.currentLanguageCode,
        defaultValue: firstTimeLanguageCode);
    if(currentLanguageCode == englishCode){
      _currentLanguage = LanguageEn();
    }
  }
}