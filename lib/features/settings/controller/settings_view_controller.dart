import 'package:damazsle/core/config/app_builder.dart';
import 'package:damazsle/core/styles/theme/app_theme.dart';
import 'package:damazsle/core/utils/localization.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  late AppBuilder _appBuilder;
  late AppTheme _appTheme;
  final RxBool _isDark = false.obs;
  final RxBool _isEnglish = false.obs;

  bool get isDark => _isDark.value;

  bool get isEnglish => _isEnglish.value;

  @override
  onInit() {
    _appBuilder = Get.find<AppBuilder>();
    _appTheme = Get.find<AppTheme>();
    _isEnglish(_appBuilder.locale.isEnglish);
    _isDark(AppTheme.isDark.value);
    super.onInit();
  }

  onChangeTheme(bool value) {
    _isDark(value);
    _appTheme.changeThemeMode(value);
  }

  onChangeLang(bool value) {
    _isEnglish(value);
    _appBuilder.updateLocale(value ? AppLocalization.en : AppLocalization.ar);
  }
}
