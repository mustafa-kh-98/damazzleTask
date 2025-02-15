import 'dart:ui';

import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../styles/app_colors.dart';

abstract class Common {
  static Widget defaultSvgImg(
      {double? height,
      double? width,
      required String svg,
      Color? iconColor,
      BoxFit? boxFit,
      EdgeInsetsDirectional? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: iconColor != null
          ? SvgPicture.asset(
              svg,
              width: width,
              height: height,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              fit: boxFit ?? BoxFit.contain,
            )
          : SvgPicture.asset(
              svg,
              width: width,
              height: height,
              fit: boxFit ?? BoxFit.contain,
            ),
    );
  }

  static showToast({
    required String message,
    required BuildContext context,
    int seconds = 3,
  }) {
    FToast fToast;
    fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999.0),
        color: AppColors.dark.s600,
      ),
      child: TextWidget(
        message,
        height: 0,
        // textStyle: context.labelW400.copyWith(color: AppColors.dark.s100),
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: seconds),
    );
  }

  static Future<Future> openDialog({
    double width = 400,
    double maxHeight = 500,
    double opacity = 0.9,
    double circular = 16,
    bool barrierDismissible = true,
    Curve transitionCurve = Curves.easeInOut,
    Color barrierColor = Colors.transparent,
    dynamic child,
  }) async {
    return Get.dialog(
      Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
          ),
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              height: Get.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: width,
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(circular),
                      color: Get.theme.cardColor.withOpacity(opacity),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff33000000),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      transitionCurve: transitionCurve,
    );
  }
}
