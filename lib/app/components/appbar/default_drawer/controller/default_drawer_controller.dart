import "package:get/get.dart";
import "package:json_app/app/theme/theme_controller.dart";
import "package:url_launcher/url_launcher.dart";

class DefaultDrawerController extends GetxController {
  late final ThemeController themeController = Get.find();

  final rtl = false.obs;
  final _idiomaAtual = "".obs;

  String get idiomaAtual => _idiomaAtual.value;

  set idiomaAtual(String val) => _idiomaAtual.value = val;

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }
}
