import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/data/models/ad_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../core/utils/common.dart';
import '../../../../shared/app_image_widget.dart';
import '../../../../shared/text_widget.dart';

class FeaturedAdCard extends StatelessWidget {
  final AdModel ad;

  const FeaturedAdCard({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: Stack(
        children: [
          AppImageWidget(
            size: Size(
              context.width,
              220,
            ),
            radius: 0,
            imageUrl:ad.coverImage,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Stack(
              children: [
                Common.defaultSvgImg(
                  svg: Assets.icon.adsTopLogo,
                  width: context.width * .5,
                  height: 60,
                ),
                Positioned(
                  right: 10,
                  top: 7,
                  child: SizedBox(
                    width: context.width * .35,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            ad.description,
                            textStyle: context.titlePrimaryColorW500.copyWith(
                              fontSize: 12,
                              color: AppColors.dark.s100,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Common.defaultSvgImg(
                                svg: Assets.icon.location,
                                height: 12,
                                width: 12,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              TextWidget(
                                ad.governorate.name,
                                textStyle:
                                    context.titlePrimaryColorW500.copyWith(
                                  fontSize: 12,
                                  color: AppColors.dark.s100,
                                ),
                                maxLines: 1,
                                children: [
                                  const TextWidget(" - "),
                                  TextWidget(ad.area.name,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 10,
            child: Common.defaultSvgImg(
              svg: Assets.icon.adsBottom,
            ),
          ),
        ],
      ),
    );
  }
}
