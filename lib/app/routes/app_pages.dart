import 'package:get/get.dart';

import '../pages/home_json/bindings/home_json_binding.dart';
import '../pages/home_json/views/home_json_view.dart';
import '../pages/home_json_screen_page/bindings/home_json_screen_page_binding.dart';
import '../pages/home_json_screen_page/views/home_json_screen_page_view.dart';
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
      name: _Paths.HOME_JSON_SCREEN_PAGE,
      page: () => JsonScreenPage(),
      binding: HomeJsonScreenPageBinding(),
    ),
  ];
}
