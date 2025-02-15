import 'package:damazsle/core/config/role.dart';
import 'package:damazsle/core/utils/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class Default {
  static const AppLocalization defaultLocale = AppLocalization.en;
  static const Role defaultRole = UnregisteredUser();

  static EdgeInsetsGeometry get defaultListPadding => EdgeInsets.only(
        bottom: Get.context!.mediaQueryPadding.bottom + 16,
        right: 15,
        left: 15,
        top: 15,
      );

  static EdgeInsetsGeometry get defaultHorizontal =>
      const EdgeInsets.symmetric(horizontal: 16);

  // static const Role defaultRole = NewUser();

  static preferredOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
