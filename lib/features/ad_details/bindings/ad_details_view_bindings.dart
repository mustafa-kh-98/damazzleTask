import 'package:damazsle/features/ad_details/controller/ad_details_view_controller.dart';
import 'package:get/get.dart';

class AdDetailsViewBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AdDetailsViewController());
  }

}