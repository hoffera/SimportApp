import "dart:async";
import "dart:convert";

import "package:flutter_advanced_drawer/flutter_advanced_drawer.dart";
import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/theme/theme_controller.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:url_launcher/url_launcher.dart";

import "../../../models/client/client_model.dart";

class DynamicJsonPageController extends GetxController {
  final int pageID;
  final Client client;
  DynamicJsonPageController(this.pageID, this.client);

  final scaffoldData = Rxn<JsonWidgetData>();

  final drawerController = AdvancedDrawerController();

  final registry = JsonWidgetRegistry.instance;
  final rtl = false.obs;
  late final ThemeController themeController = Get.find();

  final _idiomaAtual = "".obs;
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
    _setupCustomVariables();
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
    try {
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["scaffoldData"] != null) {
          scaffoldData.value = JsonWidgetData.fromDynamic(
            data["scaffoldData"],
            registry: registry,
          );
        }
      } else {
        throw Exception("Erro ao carregar: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      print("Erro ao carregar JSON: $e");
      print("Stack trace: $stackTrace");

      scaffoldData.value = null;
    }
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  void _reload() {
    _retryTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (scaffoldData.value == null) {
        await loadJson(pageID);
      } else {
        _retryTimer?.cancel();
      }
    });
  }

  void _setupCustomVariables() {
    registry.setValue(
      "userAvatarUrl",
      "https://avatars.githubusercontent.com/u/81923101?v=4",
    );
    registry.setValue("userName", "Felipe Hoffmeister");

    registry.setValue("email", "felipe@gmail.com");

    registry.setValue(
      "clientLogo",
      "https://appix.cs.simport.com.br/gallery/86/image-download",
    );
    registry.setValue("since", "Usuário desde: Jan 1, 2016");
    registry.setValue("subtitle", "ADMINISTRADOR - APPIX");

    registry.setValue("clientName", client.nome);
    registry.setValue("clientSubtitle", client.identificacao);
    registry.setValue("url", client.logo);
    registry.setValue("client", client);
  }
}
