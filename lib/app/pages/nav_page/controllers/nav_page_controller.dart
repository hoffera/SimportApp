import 'package:get/get.dart';
import 'package:json_app/app/pages/simport/mare_page.dart';
import 'package:json_app/app/pages/simport/tempo_page.dart';
import 'package:json_app/app/pages/simport/vento_page.dart';
import 'package:json_app/app/pages/test_page/bindings/test_page_binding.dart';

class NavPageController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    TestPageBinding().dependencies();
  }
  // final pages = [PageGraphCircular(), const AntoninaPage(), PageGraphPlots()];

  final pages = [MarePageView(), const VentoPageView(), TempoPageView()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
