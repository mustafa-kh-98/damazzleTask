import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/config/app_builder.dart';
import '../core/styles/assets/assets.gen.dart';
import '../core/utils/common.dart';

class ArrowIcon extends StatelessWidget {
  final Color? color;

  const ArrowIcon({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: Get.find<AppBuilder>().locale.isArabic ? 0 : pi,
      child: Common.defaultSvgImg(
        svg: Assets.icon.arrow,
        iconColor: color,
      ),
    );
  }
}
