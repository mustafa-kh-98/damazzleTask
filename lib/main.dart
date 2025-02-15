import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/styles/theme/app_theme.dart';
import 'src/app.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Get.putAsync<AppTheme>(
        () async => AppTheme().init(),
      );
      runApp(
        const DamazsleApp(),
      );
    },
    (error, stack) {
      FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(
          exception: error,
          stack: stack,
        ),
      );
    },
  );
}
