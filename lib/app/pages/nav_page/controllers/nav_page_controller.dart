import "package:get/get.dart";
import "package:json_app/app/pages/simport/mare_page.dart";
import "package:json_app/app/pages/simport/tempo_page.dart";
import "package:json_app/app/pages/simport/vento_page.dart";

class NavPageController extends GetxController {
  var currentIndex = 0.obs;

  final pages = [MarePageView(), const VentoPageView(), TempoPageView()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
