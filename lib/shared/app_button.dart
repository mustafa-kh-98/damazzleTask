import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/shared/loading.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/styles/app_colors.dart';
import 'ink_well_widget.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Color? buttonColor;
  final Color? textColor;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.buttonColor,
    this.textColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      childColor: (buttonColor ?? AppColors.primary.main),
      onTap: isLoading ? null : onTap,
      radius: 25,
      size: Size(context.width, 50),
      child: isLoading
          ? const LoadingPage()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                  title,
                  textStyle: context.titlePrimaryColorW700.copyWith(
                    fontSize: 15,
                    color: textColor??Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}
