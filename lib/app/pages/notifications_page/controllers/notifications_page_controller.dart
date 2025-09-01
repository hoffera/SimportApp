import "package:get/get.dart";
import "package:json_app/app/theme/theme_controller.dart";

class NotificationsPageController extends GetxController {
  late final ThemeController themeController = Get.find();

  final count = 0.obs;

  void increment() => count.value++;
}
