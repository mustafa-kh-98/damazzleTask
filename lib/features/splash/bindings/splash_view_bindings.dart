import 'package:damazsle/features/splash/controller/splash_view_controller.dart';
import 'package:get/get.dart';

class SplashViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewController());
  }
}
