import "package:get/get.dart";

import "../controllers/editor_client_page_controller.dart";

class EditorClientPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorClientPageController>(
      () => EditorClientPageController(Get.arguments),
    );
  }
}
