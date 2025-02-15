import 'package:damazsle/core/config/defaults.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/assets/assets.gen.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/arrow_icon.dart';
import '../../../../shared/ink_well_widget.dart';
import '../../../../shared/text_widget.dart';

class YourAdCard extends StatelessWidget {
  const YourAdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Default.defaultHorizontal,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff585C5F).withOpacity(.19),
              offset: const Offset(0, 2),
              blurRadius: 5,
              spreadRadius: -1,
            ),
          ],
        ),
        child: InkWellWidget(
          padding: const EdgeInsets.all(8),
          childColor: context.theme.cardColor,
          onTap: () {},
          radius: 8,
          size: Size(context.width, 0),
          child: Row(
            children: [
              Container(
                height: 87,
                width: 103,
                decoration: BoxDecoration(
                  color: AppColors.secondary.lighter,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: UnconstrainedBox(
                  child: Common.defaultSvgImg(
                    svg: Assets.icon.yourAd,
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      LocaleKeys.ad_description,
                      textStyle:
                          context.titlePrimaryColorW700.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextWidget(
                      LocaleKeys.better_chance_reach_syria,
                      textStyle:
                          context.titleSmallColorW400.copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextWidget(
                      LocaleKeys.contact_us,
                      textStyle: context.titlePrimaryColorW700.copyWith(
                        fontSize: 16,
                        color: AppColors.secondary.main,
                      ),
                    ),
                  ],
                ),
              ),
              ArrowIcon(
                color: AppColors.secondary.lighter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
