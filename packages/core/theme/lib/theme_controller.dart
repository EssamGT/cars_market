import 'package:cars_market/di/di.dart';
import 'package:get/get.dart';
import 'package:storage/cache/prefs_helper.dart';

class ThemeController extends GetxController {
  var themeMode = 0.obs;
  var language = "en".obs;
  @override
  void onInit() {
    super.onInit();
    loadThemeMode();
    loadLanguage();
  }

  void loadThemeMode() {
    themeMode.value = getIt.get<PrefsHelper>().getThemeMode();
  }

  void loadLanguage() {
    language.value = getIt.get<PrefsHelper>().getLocale();
  }

  void changeThemeMode(int mode) {
    themeMode.value = mode;
    getIt.get<PrefsHelper>().setThemeMode(mode);
  }

  void changeLanguage(String locale) {
    language.value = locale;
    getIt.get<PrefsHelper>().setLocale(locale);
  }
}
