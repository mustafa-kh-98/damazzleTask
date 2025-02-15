import 'package:damazsle/features/auth/controller/auth_view_controller.dart';
import 'package:get/get.dart';

class AuthViewBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthViewController());
  }
}