import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/features/menu/controller/menu_view_controller.dart';
import 'package:damazsle/shared/loading.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/menu_data_view.dart';

class MenuViewIndex extends GetView<MenuViewController> {
  const MenuViewIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading) {
            return const Center(
              child: LoadingPage(),
            );
          }
          if (!controller.isLoading && controller.homeData == null) {
            return  Center(
              child: TextWidget(
                "Error",
                textStyle: context.titlePrimaryColorW700,
              ),
            );
          }
          return const MenuDataView();
        },
      ),
    );
  }
}
