import '../services/persistent_data/persistent_data_service.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';
import 'base_controller.dart';
import '../services/persistent_data/persistent_data_keys.dart' as persistent_data_keys;

const String firstTimeThemeCode = darkThemeCode;
const String darkThemeCode = "dark";
const String lightThemeCode = "light";

class ThemeController extends BaseController {
  ThemeController._private();
  static final ThemeController _instance = ThemeController._private();
  static ThemeController getInstance() =>_instance;

  setInitialTheme() async{

    var persistentDataService = PersistentDataService.getInstance();
    var currentLanguageCode = await persistentDataService.getValue(persistent_data_keys.currentLanguageCode,
        defaultValue: firstTimeThemeCode);
    if(currentLanguageCode == darkThemeCode){
      themeProvider.currentTheme = DarkTheme().getTheme();
    }
    else if(currentLanguageCode == lightThemeCode){
      themeProvider.currentTheme = LightTheme().getTheme();
    }
  }
}