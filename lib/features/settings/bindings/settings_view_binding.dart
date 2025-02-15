import 'package:get/get.dart';

import '../controller/settings_view_controller.dart';

class SettingsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsViewController());
  }
}
