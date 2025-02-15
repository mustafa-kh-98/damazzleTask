import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:damazsle/features/ad_details/controller/ad_details_view_controller.dart';
import 'package:damazsle/features/ad_details/view/widgets/seller_card.dart';
import 'package:damazsle/features/ad_details/view/widgets/the_distinguished_words.dart';
import 'package:damazsle/features/ad_details/view/widgets/your_ad_card.dart';
import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:damazsle/shared/ink_well_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../generated/locales.g.dart';
import '../../../../shared/text_widget.dart';
import '../../../menu/view/widgets/ad_card.dart';
import '../../../menu/view/widgets/list_horizontal_builder.dart';
import 'ad_info.dart';
import 'ad_specifications.dart';
import 'details_app_bar.dart';

class AdData extends GetView<AdDetailsViewController> {
  const AdData({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: DetailsAppBar(
                  image: controller.adDetails!.coverImage,
                  images: controller.adDetails!.images,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 16,
                    ),
                    AdInfo(
                      ad: controller.adDetails!,
                    ),
                    if (controller.adDetails!.isFeatured) ...[
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 50,
                        width: context.width,
                        color: AppColors.secondary.light,
                        child: Center(
                          child: TextWidget(
                            LocaleKeys.featured,
                            textStyle: context.baseTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondary.darker,
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: 16,
                    ),
                    const YourAdCard(),
                    const SizedBox(
                      height: 16,
                    ),
                    AdSpecifications(
                      ad: controller.adDetails!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SellerCard(
                      customer: controller.adDetails!.customer,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TheDistinguishedWords(
                      tags: controller.adDetails!.tags,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ListHorizontalBuilder(
                      itemBuilder: (context, index, ad) => AdCard(ad: ad),
                      data:Get.find<MenuViewController>().homeData!.latestAds,
                      moreTitle: LocaleKeys.home_appliances,
                    ),
                    SizedBox(
                      height: context.bottomPadding + 70,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 5,left: 16,right: 16),
                decoration: BoxDecoration(
                  color: context.theme.bottomNavigationBarTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff585C5F).withOpacity(.19),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildContactCard(
                      svg: Assets.icon.phone,
                      title: LocaleKeys.call,
                      childColor: AppColors.primary.light,
                      itemColor: AppColors.primary.darker,
                    ),
                    _buildContactCard(
                      svg: Assets.icon.message,
                      title: LocaleKeys.send_message,
                      childColor: AppColors.secondary.lighter,
                      itemColor: AppColors.secondary.darker,
                    ),

                    _buildContactCard(
                      svg: Assets.icon.whtsapp,
                      title: LocaleKeys.whatsapp,
                      childColor: AppColors.success.light,
                      itemColor: AppColors.success.darker,
                    ),
                  ],
                ),
              ),
              Container(
                height: context.bottomPadding,
                color: context.theme.bottomNavigationBarTheme.backgroundColor,
              ),
            ],
          ),
        )
      ],
    );
  }

  _buildContactCard({
    required Color childColor,
    required Color itemColor,
    required String svg,
    required String title,
  }) {
    return InkWellWidget(
      childColor: childColor,
      splashColor: itemColor.withOpacity(.4),
      onTap: () {},
      radius: 4,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      size: const Size(0, 45),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Common.defaultSvgImg(
            svg: svg,
            height: 24,
            width: 24,
            iconColor: itemColor,
          ),
          const SizedBox(
            width: 8,
          ),
          TextWidget(
            title,
            textStyle: Get.context!.baseTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: itemColor,
            ),
          )
        ],
      ),
    );
  }
}
