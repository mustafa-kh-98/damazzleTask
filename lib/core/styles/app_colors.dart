import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = _BrandPrimary();
  static const secondary = _BrandSecondary();
  static const success = _BrandSuccess();
  static const warning = _BrandWarning();
  static const error = _BrandError();
  static const dark = _BrandDark();
}

final class _BrandPrimary {
  const _BrandPrimary();

  final Color darker = const Color(0xffDA800B);
  final Color dark = const Color(0xffF49A24);
  final Color main = const Color(0xffF89C26);
  final Color light = const Color(0xffFBDDB6);
  final Color lighter = const Color(0xffFFEFDA);
}

final class _BrandSecondary {
  const _BrandSecondary();

  final Color darker = const Color(0xff1E62AD);
  final Color dark = const Color(0xff2C7EDB);
  final Color main = const Color(0xff5E9DE3);
  final Color light = const Color(0xff91BCEC);
  final Color lighter = const Color(0xffC8DEF6);
}

final class _BrandWarning {
  const _BrandWarning();

  final Color darker = const Color(0xff574513);
  final Color dark = const Color(0xffa8821d);
  final Color main = const Color(0xffffc72d);
  final Color light = const Color(0xffffe8a7);
  final Color lighter = const Color(0xfffff9e9);
}

final class _BrandSuccess {
  const _BrandSuccess();

  final Color darker = const Color(0xff105234);
  final Color dark = const Color(0xff189653);
  final Color main = const Color(0xff34C759);
  final Color light = const Color(0xffD7FAE0);
  final Color lighter = const Color(0xffDFFFEE);
}

final class _BrandError {
  const _BrandError();

  final Color darker = const Color(0xff82200a);
  final Color dark = const Color(0xffb72200);
  final Color main = const Color(0xffee4520);
  final Color light = const Color(0xffffb19f);
  final Color lighter = const Color(0xffffe2dc);
}

final class _BrandDark {
  const _BrandDark();

  final Color s700 = const Color(0xff27272A);
  final Color s600 = const Color(0xff4A4A4A);
  final Color s500 = const Color(0xff808089);
  final Color s400 = const Color(0xff95989A);
  final Color s450 = const Color(0xffD2D2D2);
  final Color s300 = const Color(0xffE9E9E9);
  final Color s200 = const Color(0xffF2F2F2);
  final Color s100 = const Color(0xffffffff);
}
