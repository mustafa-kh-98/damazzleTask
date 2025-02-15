import 'package:damazsle/core/routing/pages.dart';
import 'package:damazsle/features/ad_details/bindings/ad_details_view_bindings.dart';
import 'package:damazsle/features/ad_details/view/ad_details_view_index.dart';
import 'package:damazsle/features/auth/bindings/auth_view_bindings.dart';
import 'package:damazsle/features/auth/view/auth_view_index.dart';
import 'package:damazsle/features/layout/bindings/layout_view_bindings.dart';
import 'package:damazsle/features/layout/view/layout_view_index.dart';
import 'package:damazsle/features/menu/bindings/menu_view_bindings.dart';
import 'package:damazsle/features/menu/view/menu_view_index.dart';
import 'package:damazsle/features/settings/bindings/settings_view_binding.dart';
import 'package:damazsle/features/settings/view/settings_view_index.dart';
import 'package:damazsle/features/splash/bindings/splash_view_bindings.dart';
import 'package:damazsle/features/splash/view/splash_view_index.dart';
import 'package:get/get.dart';

abstract class AppRouting {
  static List<GetPage<dynamic>> routes() => [
        GetPage(
          name: Pages.splash.route,
          page: () => const SplashViewIndex(),
          binding: SplashViewBindings(),
        ),
        GetPage(
          name: Pages.auth.route,
          page: () => const AuthViewIndex(),
          binding: AuthViewBindings(),
        ),
        GetPage(
          name: Pages.layout.route,
          page: () => const LayoutViewIndex(),
          binding: LayoutViewBindings(),
        ),
        GetPage(
          name: Pages.menu.route,
          page: () => const MenuViewIndex(),
          binding: MenuViewBindings(),
        ),
        GetPage(
          name: Pages.adDetails.route,
          page: () => const AdDetailsViewIndex(),
          binding: AdDetailsViewBindings(),
        ),
        GetPage(
          name: Pages.settings.route,
          page: () => const SettingsViewIndex(),
          binding: SettingsViewBinding(),
        ),
      ];
}
