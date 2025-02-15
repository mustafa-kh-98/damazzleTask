import 'package:damazsle/features/menu/view/menu_view_index.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/styles/assets/assets.gen.dart';

enum Items {
  menu,
  search,
  addAd,
  myAds,
  myProfile;

  bool get isAdd => this == addAd;

  @override
  toString() {
    return switch (this) {
      menu => LocaleKeys.menu,
      search => LocaleKeys.search,
      addAd => LocaleKeys.add_ad,
      myAds => LocaleKeys.my_ads,
      myProfile => LocaleKeys.my_profile,
    };
  }

  String get svg {
    return switch (this) {
      menu => Assets.icon.menu,
      search => Assets.icon.search,
      addAd => Assets.icon.add,
      myAds => Assets.icon.myAds,
      myProfile => Assets.icon.profile,
    };
  }

  Widget get page {
    return switch (this) {
      menu => const MenuViewIndex(),
      search => Container(),
      addAd => Container(),
      myAds => Container(),
      myProfile => Container(),
    };
  }
}
