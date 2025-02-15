import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/data/models/categories_model.dart';
import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:damazsle/shared/app_image_widget.dart';
import 'package:damazsle/shared/ink_well_widget.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveCardGrid extends GetView<MenuViewController> {
  const ResponsiveCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: controller.homeData!.categories.length,
      itemBuilder: (context, index) {
        final item = controller.homeData!.categories[index];
        return _buildCard(
          context: context,
          item: item,
        );
      },
    );
  }

  _buildCard({
    required BuildContext context,
    required CategoriesModel item,
  }) {
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
        onTap: () {},
        radius: 8,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        size: const Size(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageWidget(
              size: const Size(25, 25),
              imageUrl:item.image ,
            ),
            const SizedBox(height: 8),
            TextWidget(
              item.name,
              textStyle: context.titlePrimaryColorW500.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
