import 'package:get/get.dart';

import '../controllers/home_json_screen_page_controller.dart';

class HomeJsonScreenPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeJsonScreenPageController>(
      () => HomeJsonScreenPageController(),
    );
  }
}
