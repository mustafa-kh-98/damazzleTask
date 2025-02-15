import 'package:damazsle/core/routing/nav.dart';
import 'package:damazsle/core/routing/pages.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/core/styles/theme/theme_extension.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:damazsle/shared/button_circle.dart';
import 'package:damazsle/shared/ink_well_widget.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/styles/assets/assets.gen.dart';

class SearchBox extends GetView<MenuViewController> {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonCircle(
          color: AppColors.primary.main,
          svg: Assets.icon.config,
          iconColor: AppColors.dark.s100,
          onPressed: () => Nav.to(Pages.settings),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: InkWellWidget(
            childColor: context.theme.cardColor,
            border: Border.all(
              color: context.textInputTheme.borderColor,
            ),
            onTap: () {},
            radius: 30,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            size: Size(context.width, 50),
            child: Row(
              children: [
                Common.defaultSvgImg(
                  svg: Assets.icon.search,
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.5),
                          end: const Offset(0, 0),
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Obx(
                    () => TextWidget(
                      controller.categories[controller.currentIndex].toString(),
                      key: ValueKey(
                        controller.categories[controller.currentIndex],
                      ),
                      textStyle: context.titleSmallColorW400.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
