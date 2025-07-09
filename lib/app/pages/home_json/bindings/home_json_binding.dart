import 'package:get/get.dart';

import '../controllers/home_json_controller.dart';

class HomeJsonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeJsonController>(
      () => HomeJsonController(),
    );
  }
}
