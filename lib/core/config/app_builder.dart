import 'dart:developer';

import 'package:damazsle/core/config/role.dart';
import 'package:damazsle/core/utils/app_storage.dart';
import 'package:damazsle/core/utils/localization.dart';
import 'package:get/get.dart';

import '../../data/services/api_service.dart';
import '../constants/storages_names.dart';
import '../routing/nav.dart';
import 'defaults.dart';

class AppBuilder extends GetxService {
  AppStorage box = AppStorage();

  ///[LOCALE]///
  final Rx<AppLocalization> _locale = Default.defaultLocale.obs;

  AppLocalization get locale => _locale.value;

  set locale(AppLocalization value) => _locale.value = value;

  updateLocale(AppLocalization locale) {
    _locale(locale);
    Get.updateLocale(locale.locale);
    _setLocale(locale);
  }

  _setLocale(AppLocalization locale) {
    box.write("locale", locale.value);
    this.locale = locale;
  }

  ///[ROLE]///
  Role role = Default.defaultRole;

  setRole(Role? role) {
    if (role == null) {
      box.remove("role");
      return;
    }
    box.write("role", role.toString());
    this.role = role;
  }

  _loadUserData() async {
    await AppStorage().initBox(target: StoragesNames.app);
    box = AppStorage();
    if (box.isHasData("locale")) {
      locale = AppLocalization.fromString(box.read("locale"));
      if (locale != Default.defaultLocale) {
        Get.updateLocale(locale.locale);
        _setLocale(locale);
      }
    } else {
      locale = AppLocalization.fromString(
        Get.deviceLocale?.languageCode ?? Default.defaultLocale.value,
      );
      Get.updateLocale(locale.locale);
      _setLocale(locale);
    }
    if (box.isHasData("role")) {
      try {
        role = Role.fromString(box.read("role"));
      } catch (_) {
        setRole(null);
      }
    }
    _logData();
  }

  _logData() {
    log(":$role:", name: "APP ROLE");
    log(":$locale:", name: "APP LOCALE");
  }

  Future<void> init() async {
    await _loadUserData();
    Get.put(
      APIService(
        language: locale.value,
        headers: {"Accept": "application/json"},
      ),
    );
    await role.initialize();
    Nav.offUntil(role.landing);
  }
}
