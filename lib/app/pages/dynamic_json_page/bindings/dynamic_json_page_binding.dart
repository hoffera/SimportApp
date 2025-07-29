import 'package:get/get.dart';

import '../controllers/dynamic_json_page_controller.dart';

class DynamicJsonPageBinding extends Bindings {
  final int pageID;
  DynamicJsonPageBinding({required this.pageID});

  @override
  void dependencies() {
    Get.lazyPut<DynamicJsonPageController>(
      () => DynamicJsonPageController(pageID),
    );
  }
}
