import 'package:damazsle/core/styles/theme/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';

class TextInputThemeEx {
  static final textInputLight = TextInputTheme(
    borderColor: AppColors.dark.s450,
    focusedBorderColor: AppColors.primary.main,
    hintTextColor: const Color(0xff8F959E),
    fillColor: AppColors.dark.s100,
    iconColor:AppColors.dark.s450,
  );

  static final textInputDark = TextInputTheme(
    borderColor: AppColors.dark.s100,
    focusedBorderColor: AppColors.primary.main,
    hintTextColor: const Color(0xff8F959E),
    fillColor: AppColors.dark.s700,
    iconColor:AppColors.dark.s100,
  );

// static final textInputDark = TextInputTheme(
//   borderColor: AppColors.DARK_COLORS.sl500.withOpacity(.4),
//   focusedBorderColor: AppColors.SECONDARY_LIGHT_COLOR.sl700,
//   hintTextColor: AppColors.LIGHT_COLORS.sl700,
//   fillColor: AppColors.DARK_COLORS.sl600.withOpacity(.4),
//   iconColor: AppColors.LIGHT_COLORS.sl700,
// );
}
