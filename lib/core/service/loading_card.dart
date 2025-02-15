import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:damazsle/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/common.dart';

abstract class LoadingCard {
  static bool _isShow = false;

  static show() {
    if (_isShow) return;
    _isShow = true;
    return Common.openDialog(
      width: 70,
      barrierDismissible: false,
      child: const _LoadingDialog(),
    );
  }

  static remove() {
    if (!_isShow) return;
    Get.back();
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (pop, _) {
        if (!pop) {
          Common.showToast(
            message: LocaleKeys.in_processing_wait.tr,
            context: context,
          );
        }
      },
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          LoadingPage(
            loadingColor: AppColors.primary.main,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
