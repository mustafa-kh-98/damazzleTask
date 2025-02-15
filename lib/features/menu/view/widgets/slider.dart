import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../shared/app_image_widget.dart';
import '../../controller/menu_view_controller.dart';

class SliderWidget extends GetView<MenuViewController> {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller.carouselSliderController,
          itemCount: controller.homeData!.banners.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: AppColors.primary.main,
                ),
              ),
              child: AppImageWidget(
                size: Size(context.width, 180),
                radius: 6,
                isLoading: false,
                imageUrl: controller.homeData!.banners[itemIndex].media,
              ),
            ),
          ),
          options: CarouselOptions(
            onPageChanged: (index, _) => controller.onChangeSlider(index),
            height: 180,
            aspectRatio: .5,
            viewportFraction: 1,
            enlargeFactor: .3,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: controller.homeData!.banners.length>1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: controller.activeIndex,
            count: controller.homeData!.banners.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.secondary.main,
              dotColor: AppColors.secondary.lighter,
              dotHeight: 6,
              dotWidth: 6,
              expansionFactor: 5,
              spacing: 4,
              radius: 3,
            ),
          ),
        ),
      ],
    );
  }
}
