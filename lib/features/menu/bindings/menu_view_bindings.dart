import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:get/get.dart';

class MenuViewBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>MenuViewController());
  }

}