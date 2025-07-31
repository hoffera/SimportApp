import 'dart:async';
import 'dart:convert';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:json_app/app/theme/theme_controller.dart';
import 'package:json_app/config/api_constants.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicJsonPageController extends GetxController {
  DynamicJsonPageController(this.pageID);

  final appBarData = Rxn<JsonWidgetData>();
  final bodyData = Rxn<JsonWidgetData>();
  final bottomNavData = Rxn<JsonWidgetData>();
  final drawerController = AdvancedDrawerController();
  final int pageID;
  final registry = JsonWidgetRegistry.instance;
  final rtl = false.obs;
  late final ThemeController themeController = Get.find();

  final _idiomaAtual = ''.obs;
  final _lights = false.obs;
  Timer? _retryTimer;

  @override
  void onClose() {
    _retryTimer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    Get.put(ThemeController());
    loadJson(pageID);
    _reload();
  }

  void toggleRtl() {
    rtl.value = !rtl.value;
  }

  void setRtl(bool value) {
    rtl.value = value;
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

      appBarData.value = data['appBar'] != null
          ? JsonWidgetData.fromDynamic(data['appBar'], registry: registry)
          : null;

      bodyData.value = data['body'] != null
          ? JsonWidgetData.fromDynamic(data['body'], registry: registry)
          : null;

      bottomNavData.value = JsonWidgetData.fromDynamic(
        data['bottomNavigationBar'],
        registry: registry,
      );
    } else {
      throw Exception('Erro ao carregar: \${response.statusCode}');
    }
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  void _reload() {
    _retryTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (bodyData.value == null) {
        await loadJson(pageID);
      } else {
        _retryTimer?.cancel();
      }
    });
  }
}
