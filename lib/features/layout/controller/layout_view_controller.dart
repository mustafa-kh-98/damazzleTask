import 'package:get/get.dart';

import '../view/widgets/items.dart';

class LayoutViewController extends GetxController {
  final Rx<Items> _activeScreen = Items.menu.obs;

  Items get activeScreen => _activeScreen.value;

  onChangePageIndex(Items index) {
    _activeScreen(index);
  }

}
