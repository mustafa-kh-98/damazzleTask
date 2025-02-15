import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/shared/app_back_button.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../controller/settings_view_controller.dart';

class SettingsViewIndex extends GetView<SettingsViewController> {
  const SettingsViewIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                  "Light",
                  textStyle: context.titlePrimaryColorW500,
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(
                  () => CupertinoSwitch(
                    value: controller.isDark,
                    onChanged: controller.onChangeTheme,
                    activeColor: AppColors.success.main,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextWidget(
                  "Dark",
                  textStyle: context.titlePrimaryColorW500,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                  "العربية",
                  textStyle: context.titlePrimaryColorW500,
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(
                  () => CupertinoSwitch(
                    value: controller.isEnglish,
                    onChanged: controller.onChangeLang,
                    activeColor: AppColors.success.main,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextWidget(
                  "English",
                  textStyle: context.titlePrimaryColorW500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
