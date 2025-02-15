import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/core/styles/theme/theme_extension.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../core/config/app_builder.dart';
import '../core/constants/breakpoints.dart';
import 'icon_button_widget.dart';
import 'text_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.upLabel,
      this.onDownTitleTap,
      this.downLabel,
      this.initialValue,
      this.hint,
      this.prefix,
      this.prefixWidget,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength,
      this.onChange,
      this.onSuffixClicked,
      this.nextFocusNode,
      this.focusNode,
      this.validator,
      this.suffix,
      this.obscure = false,
      this.heightBetween = 10,
      this.height,
      this.textInputAction,
      this.justNumbers = false,
      this.enabled = true,
      this.isOption = false,
      this.textInputType,
      this.controller,
      this.ltr,
      this.maxLines,
      this.contentPadding,
      this.multiLines = false,
      this.onSubmitted,
      this.hideErrorText = false,
      this.suffixIconSize,
      this.textAlign = TextAlign.start,
      this.suffixIconColor,
      this.borderSideColor,
      this.suffixIconSvg,
      this.textStyle,
      this.autoValidateMode,
      this.hintTextStyle,
      this.autofillHints,
      this.autofocus = false});

  final String? upLabel;
  final String? downLabel;
  final String? initialValue;
  final double heightBetween;
  final double? suffixIconSize;
  final EdgeInsets? contentPadding;
  final String? hint;
  final int? maxLength;
  final Color? suffixIconColor;
  final Color? borderSideColor;
  final int? maxLines;
  final IconData? suffixIcon;
  final String? suffixIconSvg;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Function()? onSuffixClicked;
  final Function()? onDownTitleTap;
  final TextAlign textAlign;
  final bool obscure;
  final bool enabled;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool justNumbers;
  final bool? ltr;
  final bool multiLines;
  final bool hideErrorText;
  final bool? autofocus;
  final bool isOption;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final AutovalidateMode? autoValidateMode;
  final double? height;
  final List<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    final ltr = this.ltr ?? Get.find<AppBuilder>().locale.isEnglish;
    final Widget? sufIcon = suffix ??
        ((suffixIcon != null || suffixIconSvg != null)
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: IconButtonWidget(
                  icon: suffixIcon,
                  svg: suffixIconSvg,
                  color: suffixIconColor,
                  iconColor: context.textInputTheme.iconColor,
                  iconSize: suffixIconSize,
                  onPressed: onSuffixClicked,
                ),
              )
            : null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (upLabel != null)
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: heightBetween,
            ),
            child: Row(
              children: [
                TextWidget(
                  upLabel!,
                  textStyle:
                      context.titleSecondaryColorW500.copyWith(fontSize: 12),
                ),
                if (isOption) ...[
                  const SizedBox(
                    width: 3,
                  ),
                  TextWidget(
                    LocaleKeys.optionField.tr,
                    textStyle:
                        context.titleSmallColorW400.copyWith(fontSize: 12),
                  ),
                ]
              ],
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (prefixWidget != null) prefixWidget!,
            Expanded(
              child: TextFormField(
                textDirection: ltr ? TextDirection.ltr : TextDirection.rtl,
                controller: controller,
                autofocus: autofocus!,
                validator: validator,
                maxLength: maxLength,
                expands: multiLines,
                autovalidateMode: autoValidateMode,
                initialValue: initialValue,
                onChanged: onChange,
                textAlign: textAlign,
                onFieldSubmitted: onSubmitted,
                focusNode: focusNode,
                enabled: enabled,
                maxLines: multiLines ? null : (maxLines ?? 1),
                onEditingComplete: nextFocusNode == null
                    ? null
                    : () {
                        FocusScope.of(context).requestFocus(nextFocusNode);
                      },
                textInputAction: textInputAction,
                style: textStyle ??
                    context.titlePrimaryColorW500.copyWith(fontSize: 14),
                cursorColor: context.textInputTheme.cursorColor,
                keyboardType: textInputType,
                obscureText: obscure,
                inputFormatters: [
                  if (justNumbers) FilteringTextInputFormatter.digitsOnly
                ],
                autofillHints: autofillHints,
                contextMenuBuilder: (context, editableTextState) {
                  final List<ContextMenuButtonItem> buttonItems =
                      editableTextState.contextMenuButtonItems;
                  return AdaptiveTextSelectionToolbar.buttonItems(
                    anchors: editableTextState.contextMenuAnchors,
                    buttonItems: buttonItems,
                  );
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: hint?.tr,
                  counterText: "",
                  errorStyle: context.baseTextStyle.copyWith(
                    color: AppColors.error.main,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  // constraints: const BoxConstraints(maxHeight: 40,minHeight: 40),
                  fillColor: context.textInputTheme.fillColor,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  hintStyle: hintTextStyle ??
                      context.baseTextStyle.copyWith(
                        color: context.textInputTheme.hintTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      appRadius4r,
                    ),
                    borderSide: BorderSide(
                      color: context.textInputTheme.borderColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(appRadius4r),
                    borderSide: BorderSide(
                      color: context.textInputTheme.focusedBorderColor,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      appRadius4r,
                    ),
                    borderSide: BorderSide(
                      color: context.textInputTheme.borderColor,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(appRadius4r),
                    borderSide: BorderSide(
                      color: AppColors.error.main,
                      width: 1,
                    ),
                  ),
                  prefix: prefix,
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 40,
                    minWidth: 40,
                  ),
                  prefixIcon: prefixIcon,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 40,
                    minHeight: 20,
                  ),
                  suffixIcon: sufIcon,
                ),
              ),
            ),
          ],
        ),
        if (downLabel != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment:
                  ltr ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                TextWidget(
                  downLabel!,
                  textStyle: context.titlePrimaryColorW500.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  onTap: onDownTitleTap,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
