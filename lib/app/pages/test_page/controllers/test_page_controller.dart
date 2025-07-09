import 'dart:convert';

import 'package:get/get.dart';
import 'package:json_app/main.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TestPageController extends GetxController {
  //TODO: Implement TestPageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<JsonWidgetData?> loadJsonWidgetData() async {
    final jsonStr = await rootBundle.loadString('assets/json/Test_card.json');
    final dynamic jsonMap = json.decode(jsonStr);
    return JsonWidgetData.fromDynamic(jsonMap, registry: registry);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
