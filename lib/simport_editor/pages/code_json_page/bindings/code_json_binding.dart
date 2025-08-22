import "package:get/get.dart";

import "../controllers/code_json_controller.dart";

class CodeJsonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeJsonController>(
      () => CodeJsonController(
        json: Get.arguments["json"],
        clientId: Get.arguments["clientId"],
      ),
    );
  }
}
