import 'package:damazsle/core/routing/app_routing.dart';
import 'package:damazsle/core/routing/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '../core/config/app_builder.dart';
import '../core/config/defaults.dart';
import '../core/styles/theme/app_theme.dart';
import '../core/styles/theme/theme_data.dart';
import '../generated/locales.g.dart';

class DamazsleApp extends StatelessWidget {
  const DamazsleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppBuilder appBuilder = Get.put(
      AppBuilder(),
    );
    return Obx(
      () => GetMaterialApp(
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          Default.preferredOrientation();
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          return GestureDetector(
            onTap: () {
              Get.focusScope?.unfocus();
            },
            child: ScrollConfiguration(
              behavior: GlobalScrollBehavior(),
              child: AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarIconBrightness: AppTheme.isDark.value
                      ? Brightness.light
                      : Brightness.dark,
                  systemNavigationBarIconBrightness: AppTheme.isDark.value
                      ? Brightness.light
                      : Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: Colors.transparent,
                ),
                child: MediaQuery(
                  data: mediaQueryData.copyWith(
                    textScaler: const TextScaler.linear(1),
                  ),
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        if (constraints.maxWidth < 600) {
                          return child!;
                        }
                        return Center(
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            child: child!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        darkTheme: AppThemeData.darkTheme,
        themeMode: Get.find<AppTheme>().getThemeMode(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        translationsKeys: AppTranslation.translations,
        locale: appBuilder.locale.locale,
        defaultTransition: Transition.cupertino,
        supportedLocales:
            AppTranslation.translations.keys.map((l) => Locale(l)),
        getPages: AppRouting.routes(),
        initialRoute: Pages.splash.route,
      ),
    );
  }
}
