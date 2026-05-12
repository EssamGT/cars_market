import 'package:cars_market/di/di.dart';
import 'package:get/get.dart';
import 'package:storage/cache/prefs_helper.dart';

class ThemeController extends GetxController {
  var themeMode = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeMode();
  }

  void loadThemeMode() {
    themeMode.value = getIt.get<PrefsHelper>().getThemeMode();
  }

  void changeThemeMode(int mode) {
    themeMode.value = mode;
    getIt.get<PrefsHelper>().setThemeMode(mode);
  }
}
