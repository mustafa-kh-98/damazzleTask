import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:damazsle/data/constants/end_points.dart';
import 'package:damazsle/features/menu/model/menu_categories.dart';
import 'package:get/get.dart';

import '../../../data/helper/request.dart';
import '../../../data/models/home_model.dart';

class MenuViewController extends GetxController {
  late CarouselSliderController carouselSliderController;
  final RxInt _activeIndex = 0.obs;

  int get activeIndex => _activeIndex.value;

  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  late Timer _timer;
  final List<MenuCategories> categories = MenuCategories.values;

  ///APIS
  final RxBool _isLoading = true.obs;

  final Rx<HomeModel?> _homeModel = Rx<HomeModel?>(null);

  HomeModel? get homeData => _homeModel.value;

  bool get isLoading => _isLoading.value;
  final Request _request = Request(
    endPoint: EndPoints.home,
    method: RequestMethod.Get,
  );

  @override
  void onInit() {
    carouselSliderController = CarouselSliderController();
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        _currentIndex.value = (_currentIndex.value + 1) % categories.length;
      },
    );
    _getData();
    super.onInit();
  }

  @override
  onClose() {
    _timer.cancel();
    super.onClose();
  }

  onChangeSlider(int index) {
    _activeIndex(index);
  }

  _getData() async {
    try {
      _isLoading(true);
      final res = await _request.request();
      _homeModel.value = HomeModel.fromJson(res.data);
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      log("get an error", error: e);
    }
  }
}
