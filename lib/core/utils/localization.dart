import 'package:flutter/material.dart';

import '../config/defaults.dart';

enum AppLocalization {
  ar,
  en;

  static AppLocalization fromString(String s) {
    switch (s) {
      case "ar":
        return AppLocalization.ar;
      case "en":
        return AppLocalization.en;
      default:
        return AppLocalization.en;
      // return Default.defaultLocale;
    }
  }

  String get value {
    switch (this) {
      case AppLocalization.ar:
        return 'ar';
      case AppLocalization.en:
        return 'en';
      default:
        return Default.defaultLocale.value;
    }
  }

  bool get isArabic => this == AppLocalization.ar;

  bool get isEnglish => this == AppLocalization.en;

  Locale get locale {
    switch (this) {
      case AppLocalization.ar:
        return const Locale('ar');
      case AppLocalization.en:
        return const Locale('en');
      default:
        return Locale(
          Default.defaultLocale.value,
        );
    }
  }

  @override
  String toString() => switch (this) {
        en => "English",
        ar => "العربية",
      };
}
