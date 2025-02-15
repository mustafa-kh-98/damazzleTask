import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/data/models/ad_details_model.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/config/defaults.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../core/utils/common.dart';
import '../../../../shared/text_widget.dart';
import 'info_card.dart';

class AdInfo extends StatelessWidget {
  final AdDetailsModel ad;

  const AdInfo({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Default.defaultHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              InfoCard(
                backgroundColor: AppColors.primary.light,
                titleColor: AppColors.primary.darker,
                title: "${LocaleKeys.views_count.tr}: ${ad.viewsCount}",
              ),
              InfoCard(
                backgroundColor: AppColors.dark.s300,
                titleColor: AppColors.dark.s500,
                title: ad.governorate.name,
              ),
              InfoCard(
                backgroundColor: AppColors.success.light,
                titleColor: AppColors.success.dark,
                title: ad.statusTitle,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                ad.title,
                textStyle: context.titlePrimaryColorW700.copyWith(fontSize: 22),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Common.defaultSvgImg(
                    svg: Assets.icon.phone,
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(
                    LocaleKeys.price_contact,
                    textStyle: context.titlePrimaryColorW400.copyWith(
                      fontSize: 16,
                      color: AppColors.primary.main,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateTime.parse(ad.createdAt).getRelativeTime,
                    style: context.titleSmallColorW400.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
