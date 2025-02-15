import 'dart:math';

import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/shared/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import '../../../../core/routing/nav.dart';
import '../../../../core/routing/pages.dart';
import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../shared/button_circle.dart';
import 'search_box.dart';

class MenuAppBar extends SliverPersistentHeaderDelegate {
  final double minTopBarHeight =
      Get.mediaQuery.viewPadding.top + kToolbarHeight;
  final double maxTopBarHeight = Get.mediaQuery.viewPadding.top + 90;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var shrinkFactor = min(1, shrinkOffset / (maxExtent - minExtent));
    double currentHeight =
        max(maxTopBarHeight * (1 - shrinkFactor * 1.45), minTopBarHeight);

    double radius = lerpDouble(30, 0, shrinkFactor.toDouble()) ?? 0;

    double searchBoxVerticalOffset =
        lerpDouble(0, 0, shrinkFactor.toDouble()) ?? 0;
    double opacity = lerpDouble(0, 1, shrinkFactor.toDouble()) ?? 0;
    var topBar = Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        height: currentHeight,
        decoration: BoxDecoration(
          color: AppColors.primary.main,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        padding: EdgeInsets.only(
          top: context.topPadding,
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: opacity,
              child: ButtonCircle(
                size: const Size(40, 40),
                color: Colors.transparent,
                svg: Assets.icon.config,
                iconColor: AppColors.dark.s100,
                onPressed: opacity == 0 ? null : () => Nav.to(Pages.settings),
              ),
            ),
            const Expanded(
              child: AppLogo(),
            ),
            Opacity(
              opacity: opacity,
              child: ButtonCircle(
                size: const Size(40, 40),
                color: Colors.transparent,
                svg: Assets.icon.search,
                iconColor: AppColors.dark.s100,
              ),
            ),
          ],
        ),
      ),
    );

    return Stack(
      fit: StackFit.loose,
      children: [
        if (shrinkFactor <= 0.5) topBar,
        Positioned(
          left: 20,
          right: 20,
          bottom: searchBoxVerticalOffset,
          child: const SearchBox(),
        ),
        if (shrinkFactor > 0.5) topBar,
      ],
    );
  }

  @override
  double get maxExtent => maxTopBarHeight + 25;

  @override
  double get minExtent => minTopBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
