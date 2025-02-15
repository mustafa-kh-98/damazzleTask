import 'package:damazsle/generated/locales.g.dart';
import 'package:get/get.dart';

abstract class Validator {
  static String? emailValidation(String? email) {
    if (email!.isEmpty) {
      return LocaleKeys.no_null_valid.tr;
    } else {
      email = email.trim();
      bool valid = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
      return valid == false ? LocaleKeys.email_valid.tr : null;
    }
  }

  static String? validatePass(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.no_null_valid.tr;
    }else if (value.length < 8 || value.length > 32) {
      return LocaleKeys.password_valid.tr;
    } else {
      return null;
    }
  }
}
