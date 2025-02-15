import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/constants/end_points.dart';
import '../../../data/helper/request.dart';
import '../../../data/models/ad_details_model.dart';

class AdDetailsViewController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxBool _shoMore = false.obs;

  final Rx<AdDetailsModel?> _adDetails = Rx<AdDetailsModel?>(null);

  AdDetailsModel? get adDetails => _adDetails.value;

  bool get isLoading => _isLoading.value;

  bool get shoMore => _shoMore.value;
  final Request _request = Request(
    endPoint: EndPoints.details,
    method: RequestMethod.Get,
  );

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  onSwitchMore() {
    _shoMore(!shoMore);
  }

  _getData() async {
    try {
      _isLoading(true);
      final res = await _request.request();
      _adDetails.value = AdDetailsModel.fromJson(res.data["ad"]);
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      log("get an error", error: e);
    }
  }
}
