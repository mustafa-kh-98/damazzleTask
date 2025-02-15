import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/styles/app_colors.dart';
import 'featured_ad_card.dart';
import 'more_card.dart';

class FeaturedAds extends GetView<MenuViewController> {
  const FeaturedAds({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.homeData!.featuredAds.isEmpty
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.only(
              top: 6,
              bottom: 12,
            ),
            decoration: BoxDecoration(color: AppColors.primary.light),
            child: Column(
              children: [
                const MoreCard(
                  title: LocaleKeys.featured_ads,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction:
                            controller.homeData!.featuredAds.length > 1
                                ? 0.8
                                : 0.95,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 8,
                        ),
                        child: FeaturedAdCard(
                          ad: controller.homeData!.featuredAds[i],
                        ),
                      ),
                      itemCount: controller.homeData!.featuredAds.length,
                      padEnds: false,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
