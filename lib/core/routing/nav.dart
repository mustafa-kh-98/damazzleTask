import 'package:get/get.dart';

import 'pages.dart';

abstract class Nav {
  static Future? to(Pages page, {dynamic arguments}) => Get.toNamed(
        page.route,
        arguments: arguments,
      );

  static Future? replacement(Pages page, {dynamic arguments}) => Get.offNamed(
        page.route,
        arguments: arguments,
      );

  static Future? offAll(Pages page, {dynamic arguments}) => Get.offNamed(
        page.route,
        arguments: arguments,
      );

  static Future? offUntil(Pages page, {dynamic arguments}) => Get.offNamedUntil(
        page.route,
        (route) => false,
        arguments: arguments,
      );
}
