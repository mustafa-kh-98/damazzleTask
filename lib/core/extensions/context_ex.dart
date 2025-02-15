import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension ContextEx on BuildContext{
  double get sw => MediaQuery.of(this).size.width;

  double get sh => MediaQuery.of(this).size.height;

  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;
  double get bottomInsetsPadding => MediaQuery.of(this).viewInsets.bottom;

  double get topPadding => MediaQuery.of(this).viewPadding.top;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}

extension DateEx on DateTime{
  String get getRelativeTime {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);
    if (difference.inDays >= 365) {
      int years = difference.inDays ~/ 365;
      return LocaleKeys.date_years_ago.trParams({'count': years.toString()});
    } else if (difference.inDays >= 30) {
      int months = difference.inDays ~/ 30;
      return LocaleKeys.date_months_ago.trParams({'count': months.toString()});
    } else if (difference.inDays > 0) {
      return LocaleKeys.date_days_ago.trParams({'count': difference.inDays.toString()});
    } else if (difference.inHours > 0) {
      return LocaleKeys.date_hours_ago.trParams({'count': difference.inHours.toString()});
    } else if (difference.inMinutes > 0) {
      return LocaleKeys.date_minutes_ago.trParams({'count': difference.inMinutes.toString()});
    } else {
      return LocaleKeys.date_just_now.tr;
    }
  }
}