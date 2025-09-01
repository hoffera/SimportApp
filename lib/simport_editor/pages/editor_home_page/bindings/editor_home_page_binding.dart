import "package:get/get.dart";

import "../controllers/editor_home_page_controller.dart";

class EditorHomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorHomePageController>(() => EditorHomePageController());
  }
}
