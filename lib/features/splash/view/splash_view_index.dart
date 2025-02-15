import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/features/splash/controller/splash_view_controller.dart';
import 'package:damazsle/shared/app_logo.dart';
import 'package:damazsle/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SplashViewIndex extends GetView<SplashViewController> {
  const SplashViewIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary.main,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.primary.lighter,
            highlightColor: AppColors.primary.main.withOpacity(.7),
            period: const Duration(seconds: 2),
            child: const AppLogo(),
          ),
          Positioned(
            bottom: context.bottomPadding + 16,
            child: Obx(
              () => LoadingPage(
                isLoading: controller.isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
