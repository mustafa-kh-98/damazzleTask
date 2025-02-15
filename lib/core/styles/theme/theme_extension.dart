import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:flutter/material.dart';

part 'theme_extension.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class TextInputTheme extends ThemeExtension<TextInputTheme>
    with _$TextInputThemeTailorMixin {
  const TextInputTheme({
    required this.borderColor,
    this.cursorColor,
    required this.focusedBorderColor,
    required this.hintTextColor,
    required this.fillColor,
    required this.iconColor,
  });

  @override
  final Color? cursorColor;
  @override
  final Color fillColor;
  @override
  final Color hintTextColor;
  @override
  final Color borderColor;
  @override
  final Color focusedBorderColor;
  @override
  final Color iconColor;
}


@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class ActionButtonTheme extends ThemeExtension<ActionButtonTheme>
    with _$ActionButtonThemeTailorMixin {
  const ActionButtonTheme({
    required this.color,
    required this.textColor,
  });

  @override
  final Color? color;
  final Color? textColor;

}
