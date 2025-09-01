import "package:get/get.dart";

import "../../../models/client/client_model.dart";
import "../controllers/dynamic_json_page_controller.dart";

class DynamicJsonPageBinding extends Bindings {
  final int pageID;
  final Client client;
  DynamicJsonPageBinding({required this.pageID, required this.client});

  @override
  void dependencies() {
    Get.lazyPut<DynamicJsonPageController>(
      () => DynamicJsonPageController(pageID, client),
    );
  }
}
