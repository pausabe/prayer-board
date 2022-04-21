import 'languages/language_en.dart';
import 'languages/languages.dart';

class LanguageService {
  LanguageService._private();
  static final LanguageService _instance = LanguageService._private();
  static LanguageService getInstance() =>_instance;

  var _currentLanguage;

  Languages getCurrentLanguage() {
    return _currentLanguage ??= LanguageEn();
  }
}