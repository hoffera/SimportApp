import "package:get/get.dart";

import "../controllers/nav_page_controller.dart";

class NavPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavPageController>(() => NavPageController());
  }
}
