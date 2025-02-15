import 'dart:developer';

import '../routing/pages.dart';

abstract class Role {
  const Role();

  static Role fromString(String s) {
    switch (s) {
      case "unregistered_user":
        return const UnregisteredUser();
      case "Normal":
        return const User();
      case "guest":
        return const Guest();
      default:
        throw const UnregisteredUser();
    }
  }

  @override
  String toString() {
    switch (runtimeType) {
      case UnregisteredUser:
        return "unregistered_user";
      case User:
        return "Normal";
      case Guest:
        return "guest";

      default:
        throw Exception("invalid role you must define toString function");
    }
  }

  Future initialize();

  Pages get landing;
}

//SECTION - Unregistered users
class UnregisteredUser extends Role {
  const UnregisteredUser();

  @override
  Future initialize() async {
    log("initialize unregistered user");
  }

  @override
  Pages get landing => Pages.auth;
}

class User extends Role {
  const User();

  @override
  Future initialize() async {}

  @override
  Pages get landing => Pages.layout;
}

class Guest extends Role {
  const Guest();

  @override
  Future initialize() async {}

  @override
  Pages get landing => Pages.layout;
}
