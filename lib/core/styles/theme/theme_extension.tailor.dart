// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$TextInputThemeTailorMixin on ThemeExtension<TextInputTheme> {
  Color? get cursorColor;
  Color get fillColor;
  Color get hintTextColor;
  Color get borderColor;
  Color get focusedBorderColor;
  Color get iconColor;

  @override
  TextInputTheme copyWith({
    Color? cursorColor,
    Color? fillColor,
    Color? hintTextColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? iconColor,
  }) {
    return TextInputTheme(
      cursorColor: cursorColor ?? this.cursorColor,
      fillColor: fillColor ?? this.fillColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  TextInputTheme lerp(
      covariant ThemeExtension<TextInputTheme>? other, double t) {
    if (other is! TextInputTheme) return this as TextInputTheme;
    return TextInputTheme(
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t),
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      focusedBorderColor:
          Color.lerp(focusedBorderColor, other.focusedBorderColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextInputTheme &&
            const DeepCollectionEquality()
                .equals(cursorColor, other.cursorColor) &&
            const DeepCollectionEquality().equals(fillColor, other.fillColor) &&
            const DeepCollectionEquality()
                .equals(hintTextColor, other.hintTextColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality()
                .equals(focusedBorderColor, other.focusedBorderColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(cursorColor),
      const DeepCollectionEquality().hash(fillColor),
      const DeepCollectionEquality().hash(hintTextColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(focusedBorderColor),
      const DeepCollectionEquality().hash(iconColor),
    );
  }
}

extension TextInputThemeBuildContext on BuildContext {
  TextInputTheme get textInputTheme =>
      Theme.of(this).extension<TextInputTheme>()!;
}

mixin _$ActionButtonThemeTailorMixin on ThemeExtension<ActionButtonTheme> {
  Color? get color;
  Color? get textColor;

  @override
  ActionButtonTheme copyWith({
    Color? color,
    Color? textColor,
  }) {
    return ActionButtonTheme(
      color: color ?? this.color,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ActionButtonTheme lerp(
      covariant ThemeExtension<ActionButtonTheme>? other, double t) {
    if (other is! ActionButtonTheme) return this as ActionButtonTheme;
    return ActionButtonTheme(
      color: Color.lerp(color, other.color, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionButtonTheme &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality().equals(textColor, other.textColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(textColor),
    );
  }
}

extension ActionButtonThemeBuildContext on BuildContext {
  ActionButtonTheme get actionButtonTheme =>
      Theme.of(this).extension<ActionButtonTheme>()!;
}
