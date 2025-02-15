import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:flutter/material.dart';


import '../core/styles/assets/assets.gen.dart';
import '../core/utils/common.dart';
import 'ink_well_widget.dart';
import 'shimmer_loading.dart';

class AppImageWidget extends StatelessWidget {
  final String? imageUrl;
  final Size size;
  final double radius;
  final bool isLoading;
  final Widget? errorWidget;
  final BoxFit fit;
  final void Function()? onTap;

  const AppImageWidget({
    super.key,
    required this.size,
    this.radius = 10,
    this.imageUrl,
    this.isLoading = false,
    this.errorWidget,
    this.fit=BoxFit.cover,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ShimmerLoading(
        radius: radius,
        size: size,
      );
    }
    Widget child;
    if (imageUrl == null || imageUrl!.isEmpty) {
      child = errorWidget ??
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.primary.lighter,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: UnconstrainedBox(
              child: Center(
                child: Common.defaultSvgImg(
                  svg: Assets.icon.appLogo,
                  iconColor: AppColors.primary.light,
                  boxFit: BoxFit.cover,
                  height: size.height * .15,
                  width: size.height * .15,
                ),
              ),
            ),
          );
    } else {
      child = CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        fit: fit,
        height: size.height,
        width: size.width,
        errorWidget: (_, __, ___) {
          return errorWidget ??
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.primary.lighter,
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: UnconstrainedBox(
                  child: Center(
                    child: Common.defaultSvgImg(
                      svg: Assets.icon.appLogo,
                      iconColor: AppColors.primary.light,
                      boxFit: BoxFit.cover,
                      height: size.height * .15,
                      width: size.height * .15,
                    ),
                  ),
                ),
              );
        },
        progressIndicatorBuilder: (_, __, progress) {
          return ShimmerLoading(
            radius: radius,
            size: size,
          );
        },
      );
    }

    return InkWellWidget(
      childColor: Colors.transparent,
      onTap: onTap,
      radius: radius,
      size: size,
      child: child,
    );
  }
}
