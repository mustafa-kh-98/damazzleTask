import 'package:damazsle/core/config/defaults.dart';
import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/core/styles/theme/theme_extension.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:damazsle/features/auth/controller/auth_view_controller.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:damazsle/shared/app_logo.dart';
import 'package:damazsle/shared/ink_well_widget.dart';
import 'package:damazsle/shared/text_field_widget.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/assets/assets.gen.dart';
import '../../../core/utils/validator.dart';
import '../../../shared/app_button.dart';

class AuthViewIndex extends GetView<AuthViewController> {
  const AuthViewIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary.main,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: context.topPadding + 20,
            child: const AppLogo(),
          ),
          Positioned.fill(
            top: context.topPadding + 80,
            child: Container(
              width: context.sw,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: context.theme.scaffoldBackgroundColor,
              ),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: Default.defaultListPadding,
                  children: [
                    Center(
                      child: TextWidget(
                        LocaleKeys.login,
                        textStyle: context.titlePrimaryColorW600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextWidget(
                        LocaleKeys.welcome_back,
                        textStyle: context.titleSmallColorW400,
                      ),
                    ),
                    Center(
                      child: TextWidget(
                        LocaleKeys.ads_message,
                        textStyle: context.titleSmallColorW400,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWellWidget(
                      childColor: context.actionButtonTheme.color!,
                      onTap: controller.onGoogleLogin,
                      radius: 25,
                      size: Size(context.width, 50),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Common.defaultSvgImg(svg: Assets.icon.google),
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            LocaleKeys.continue_with_google,
                            textStyle: context.titlePrimaryColorW500.copyWith(
                              fontSize: 14,
                                color: context.actionButtonTheme.textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            endIndent: 10,
                          ),
                        ),
                        TextWidget(
                          LocaleKeys.or,
                          textStyle: context.titlePrimaryColorW500
                              .copyWith(fontSize: 14),
                        ),
                        const Expanded(
                          child: Divider(
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    TextFieldWidget(
                      upLabel: LocaleKeys.email_phone,
                      hint: LocaleKeys.email_phone_hint,
                      ltr: true,
                      controller: controller.emailController,
                      nextFocusNode: controller.passNode,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      validator: Validator.emailValidation,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      upLabel: LocaleKeys.password,
                      hint: LocaleKeys.password_hint,
                      ltr: true,
                      controller: controller.passController,
                      focusNode: controller.passNode,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: Validator.validatePass,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      obscure: true,
                      autofillHints: const [
                        AutofillHints.password,
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          LocaleKeys.remember_me,
                          textStyle: context.titleSecondaryColorW500
                              .copyWith(fontSize: 12),
                        ),
                        const Spacer(),
                        Obx(
                          () => CupertinoSwitch(
                            value: controller.remember,
                            onChanged: controller.onChangeRememberMeState,
                            activeColor: AppColors.success.main,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    AppButton(
                      title: LocaleKeys.login,
                      onTap: controller.onLogin,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Center(
                      child: TextWidget(
                        LocaleKeys.no_account,
                        textStyle: context.titleSecondaryColorW500
                            .copyWith(fontSize: 14),
                        children: [
                          const TextWidget(" "),
                          TextWidget(
                            LocaleKeys.create_account,
                            textStyle: context.titleSecondaryColorW500.copyWith(
                              fontSize: 14,
                              color: AppColors.primary.main,
                              decorationColor: AppColors.primary.main,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      title: LocaleKeys.continue_as_guest,
                      textColor: AppColors.secondary.light,
                      buttonColor: Colors.transparent,
                      onTap: controller.onLoginAsGuest,
                    ),
                    SizedBox(
                      height: Get.mediaQuery.viewInsets.bottom,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
