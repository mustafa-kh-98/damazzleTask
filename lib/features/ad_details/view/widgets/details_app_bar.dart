import 'dart:math';

import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/shared/app_image_widget.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import '../../../../core/config/app_builder.dart';
import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../shared/button_circle.dart';
import '../../../../shared/image_view_screen.dart';

class DetailsAppBar extends SliverPersistentHeaderDelegate {
  final double minTopBarHeight =
      Get.mediaQuery.viewPadding.top + kToolbarHeight;
  final double maxTopBarHeight = Get.mediaQuery.viewPadding.top + 200;
  final String? image;
  final List<String> images;

  DetailsAppBar({
    required this.image,
    required this.images,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var shrinkFactor = min(1, shrinkOffset / (maxExtent - minExtent));

    double blurValue = lerpDouble(0, 10, shrinkFactor.toDouble()) ?? 0;
    double opacity = lerpDouble(1, 0, shrinkFactor.toDouble()) ?? 0;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          bottom: 21,
          child: Stack(
            children: [
              AppImageWidget(
                size: Size(
                  context.width,
                  maxTopBarHeight,
                ),
                radius: 0,
                imageUrl: image,
                onTap: () => Get.to(
                  () => ImagesViewScreen(
                    currentIndex: 0,
                    images: images,
                  ),
                ),
              ),
              if(blurValue!=0)
              ClipRect(
                child: BackdropFilter(
                  filter:
                      ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                  child: Container(
                    width: context.width,
                    height: maxTopBarHeight,
                    color: AppColors.primary.main.withOpacity(blurValue / 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Opacity(
              opacity: opacity,
              child: Row(
                children: [
                  ButtonCircle(
                    size: const Size(42, 42),
                    svg: Assets.icon.share,
                    color: AppColors.dark.s100,
                    onPressed: opacity == 0 ? null : () {},
                    useColorForSvg: false,
                    showShadow: true,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonCircle(
                    size: const Size(42, 42),
                    svg: Assets.icon.heart,
                    iconSize: 19,
                    color: AppColors.dark.s100,
                    onPressed: opacity == 0 ? null : () {},
                    useColorForSvg: false,
                    showShadow: true,
                  ),
                  const Spacer(),
                  Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: TextWidget(
                        "01/${images.length}",
                        textDirection: TextDirection.ltr,
                        textStyle: context.baseTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark.s100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: context.topPadding,
          start: 15,
          child: Transform.rotate(
            angle: !Get.find<AppBuilder>().locale.isArabic ? 0 : pi,
            child: ButtonCircle(
              size: const Size(35, 35),
              svg: Assets.icon.arrow,
              iconSize: 20,
              color: AppColors.dark.s100,
              onPressed: Get.back,
              useColorForSvg: false,
              showShadow: true,
            ),
          ),
        ),

      ],
    );
  }

  @override
  double get maxExtent => maxTopBarHeight;

  @override
  double get minExtent => minTopBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
