import 'dart:math';

import 'package:damazsle/core/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/app_builder.dart';
import '../core/styles/assets/assets.gen.dart';
import 'ink_well_widget.dart';

class AppBackButton extends StatelessWidget {
  final void Function()? onBackTao;
  final Widget? child;
  final Size? size;
  final bool isSheet;
  final Color? color;
  final Color? iconColor;

  const AppBackButton({
    super.key,
    this.onBackTao,
    this.child,
    this.size,
    this.color,
    this.iconColor,
    this.isSheet = false,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: InkWellWidget(
        size: const Size(45, 45),
        onTap: onBackTao ?? Get.back,
        childColor: Colors.transparent,
        radius: 45,
        child: Transform.rotate(
          angle: !Get.find<AppBuilder>().locale.isArabic ? 0 : pi,
          child: isSheet
              ? Icon(
                  Icons.clear,
                  color: iconColor,
                )
              : Common.defaultSvgImg(
                  svg: Assets.icon.arrow,
                  iconColor: iconColor,
                ),
        ),
      ),
    );
  }
}
