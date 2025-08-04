import 'package:get/get.dart';

import '../pages/home_json/bindings/home_json_binding.dart';
import '../pages/home_json/views/home_json_view.dart';
import '../pages/home_page/bindings/home_page_binding.dart';
import '../pages/home_page/views/home_page_view.dart';
import '../pages/login_page/bindings/login_page_binding.dart';
import '../pages/login_page/views/login_page_view.dart';
import '../pages/notifications_page/bindings/notifications_page_binding.dart';
import '../pages/notifications_page/views/notifications_page_view.dart';
import '../pages/test_page/bindings/test_page_binding.dart';
import '../pages/test_page/views/test_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_HOME;

  static final routes = [
    GetPage(
      name: _Paths.TEST_PAGE,
      page: () => TestPageView(),
      binding: TestPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_JSON,
      page: () => const HomeJsonView(),
      binding: HomeJsonBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS_PAGE,
      page: () => const NotificationsPageView(),
      binding: NotificationsPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
  ];
}
