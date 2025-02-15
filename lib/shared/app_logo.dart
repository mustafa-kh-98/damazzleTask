import 'package:damazsle/core/styles/assets/assets.gen.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Hero(
        tag: "APP_LOGO",
        child: Common.defaultSvgImg(
          svg: Assets.icon.appLogo,
        ),
      ),
    );
  }
}
