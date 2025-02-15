import 'package:damazsle/features/layout/controller/layout_view_controller.dart';
import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:get/get.dart';

class LayoutViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutViewController());
    Get.lazyPut(() => MenuViewController());
  }
}
