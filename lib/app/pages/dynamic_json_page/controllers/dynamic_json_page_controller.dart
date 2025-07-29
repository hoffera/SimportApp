import 'dart:convert';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:json_app/app/theme/theme_controller.dart';
import 'package:json_app/config/api_constants.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DynamicJsonPageController extends GetxController {
  DynamicJsonPageController(this.pageID);

  final drawerController = AdvancedDrawerController();
  final int pageID;
  final registry = JsonWidgetRegistry.instance;
  final widgetData = Rxn<JsonWidgetData>();
  late final ThemeController themeController = Get.find();
  final _idiomaAtual = 'Português'.obs;
  final _lights = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(ThemeController());
    loadJson(pageID);
  }

  String get idiomaAtual => _idiomaAtual.value;

  set idiomaAtual(String val) => _idiomaAtual.value = val;

  bool get lights => _lights.value;

  set lights(bool val) => _lights.value = val;

  Future<void> loadJson(int pageID) async {
    final url = Uri.parse(ApiConstants.getView(pageID.toString()));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      widgetData.value = JsonWidgetData.fromDynamic(
        data['json'],
        registry: registry,
      );
    } else {
      throw Exception('Erro ao carregar: \${response.statusCode}');
    }
  }
}
