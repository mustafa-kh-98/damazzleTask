import 'package:damazsle/core/config/app_builder.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  final RxBool _isLoading = true.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        _isLoading(false);
        Get.find<AppBuilder>().init();
      },
    );
    super.onInit();
  }
}
