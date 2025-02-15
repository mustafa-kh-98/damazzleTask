import 'package:damazsle/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerLoading extends StatelessWidget {
  final Size size;
  final double radius;
  const ShimmerLoading({super.key, required this.size, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primary.lighter,
      highlightColor: AppColors.primary.light,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
