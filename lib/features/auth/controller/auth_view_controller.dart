import 'package:damazsle/core/config/app_builder.dart';
import 'package:damazsle/core/config/role.dart';
import 'package:damazsle/core/routing/nav.dart';
import 'package:damazsle/core/routing/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/service/loading_card.dart';

class AuthViewController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passController;
  FocusNode passNode = FocusNode();
  final RxBool _rememberMe = false.obs;

  bool get remember => _rememberMe.value;

  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  onChangeRememberMeState(bool value) {
    _rememberMe(value);
  }

  onLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    LoadingCard.show();
    await Future.delayed(
      const Duration(seconds: 3),
    );
    LoadingCard.remove();
    Get.find<AppBuilder>().setRole(const User());
    Nav.offUntil(Pages.layout);
  }

  onLoginAsGuest() {}

  onGoogleLogin() {}
}
