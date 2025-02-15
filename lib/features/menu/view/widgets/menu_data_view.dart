import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import 'ad_card.dart';
import 'featured_ads.dart';
import 'grid.dart';
import 'list_horizontal_builder.dart';
import 'menu_app_bar.dart';
import 'slider.dart';

class MenuDataView extends GetView<MenuViewController> {
  const MenuDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: MenuAppBar(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(
                height: 20,
              ),
              const ResponsiveCardGrid(),
              const SizedBox(
                height: 16,
              ),
              const SliderWidget(),
              const SizedBox(
                height: 16,
              ),
              const FeaturedAds(),
              const SizedBox(
                height: 16,
              ),
              ListHorizontalBuilder(
                itemBuilder: (context, index, ad) => AdCard(ad: ad),
                data:controller.homeData!.latestAds,
                moreTitle: LocaleKeys.latest_ads,
              ),
              const SizedBox(
                height: 8,
              ),
              ListHorizontalBuilder(
                itemBuilder: (context, index, ad) => AdCard(ad: ad),
                data:controller.homeData!.latestAds,
                moreTitle: LocaleKeys.real_estate_ads,
              ),
              const SizedBox(
                height: 8,
              ),
              ListHorizontalBuilder(
                itemBuilder: (context, index, ad) => AdCard(ad: ad),
                data:controller.homeData!.latestAds,
                moreTitle: LocaleKeys.car_ads,
              ),
              const SizedBox(
                height: 8,
              ),
              ListHorizontalBuilder(
                itemBuilder: (context, index, ad) => AdCard(ad: ad),
                data:controller.homeData!.latestAds,
                moreTitle: LocaleKeys.home_appliances,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
