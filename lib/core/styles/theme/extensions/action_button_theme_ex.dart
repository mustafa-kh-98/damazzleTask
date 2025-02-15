import 'package:damazsle/core/styles/theme/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';

class ActionButtonThemeEx {
  static final light = ActionButtonTheme(
    color: AppColors.dark.s200,
    textColor: AppColors.dark.s700,
  );

  static final dark = ActionButtonTheme(
    color: AppColors.dark.s500,
    textColor: AppColors.dark.s100,
  );

// static final textInputDark = TextInputTheme(
//   borderColor: AppColors.DARK_COLORS.sl500.withOpacity(.4),
//   focusedBorderColor: AppColors.SECONDARY_LIGHT_COLOR.sl700,
//   hintTextColor: AppColors.LIGHT_COLORS.sl700,
//   fillColor: AppColors.DARK_COLORS.sl600.withOpacity(.4),
//   iconColor: AppColors.LIGHT_COLORS.sl700,
// );
}
