import 'dart:developer';

import 'package:damazsle/core/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../constants/storages_names.dart';

class AppTheme extends GetxController {
  Future<AppTheme> init() async {
    await AppStorage().initBox(target: StoragesNames.app);
    await changeThemeMode();
    return this;
  }

  static RxBool isDark = true.obs;

  bool _getSystemTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool? isDarkMode() => AppStorage().read(StoragesNames.darkMode);

  bool isSavedDarkMode() {
    return isDarkMode() ?? _getSystemTheme();
  }

  Future saveThemeMode(bool isDarkMode) =>
      AppStorage().write(StoragesNames.darkMode, isDarkMode);

  Future changeThemeMode([bool? isDarkMode]) async {
    log("Is Theme Dark ${isSavedDarkMode().toString()}", name: "APP THEME");
    isDark((isDarkMode ?? isSavedDarkMode()));
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
    await saveThemeMode(isDark.value);
  }
}
