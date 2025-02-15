import 'package:damazsle/core/routing/nav.dart';
import 'package:damazsle/core/routing/pages.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/data/models/ad_model.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../core/utils/common.dart';
import '../../../../shared/app_image_widget.dart';
import '../../../../shared/ink_well_widget.dart';
import '../../../../shared/text_widget.dart';

class AdCard extends StatelessWidget {
  final AdModel ad;

  const AdCard({
    super.key,
    required this.ad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        childColor: context.theme.cardColor,
        onTap: () {
          Nav.to(Pages.adDetails);
        },
        padding: const EdgeInsets.all(4),
        radius: 6,
        size: const Size(150, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppImageWidget(
              size: Size(150, 100),
              radius: 4,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Common.defaultSvgImg(
                  svg: Assets.icon.phone,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: TextWidget(
                    LocaleKeys.price_contact,
                    textStyle: context.titlePrimaryColorW600.copyWith(
                      color: AppColors.primary.main,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            TextWidget(
              ad.description,
              textStyle: context.titlePrimaryColorW700.copyWith(
                fontSize: 12,
              ),
              maxLines: 1,
            ),
            const SizedBox(
              height: 4,
            ),
            TextWidget(
              ad.governorate.name,
              textStyle: context.titleSmallColorW500.copyWith(
                fontSize: 12,
              ),
              maxLines: 1,
              children: [
                const TextWidget(" - "),
                TextWidget(ad.area.name,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
