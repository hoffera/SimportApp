import "dart:convert";

import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart";
import "package:json_app/app/pages/dynamic_json_page/views/dynamic_json_page_view.dart";
import "package:json_app/app/pages/home_json_screen_page/views/full_widget_page.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class RegisterFunctions {
  static void registerAllFunctions(JsonWidgetRegistry registry) {
    registry.registerFunctions({
      "navigatePage": _createNavigatePageFunction(),
      "selectedIndex": _createSelectedIndexFunction(),

      "showDrawer": _createShowDrawerFunction(),
      "navBarIndex": _createNavBarIndexFunction(),
    });

    registry.setValue("currentPageIndex", 0);
  }

  static JsonWidgetFunction _createNavigatePageFunction() {
    return ({args, required registry}) => () async {
      final dynamic pageId = args != null && args.isNotEmpty ? args[0] : null;
      final dynamic client = args != null && args.isNotEmpty ? args[1] : null;
      if (pageId == null) {
        print("[navigatePage] ID da página não fornecido.");
        throw Exception("ID da página não fornecido.");
      }

      int pageIdInt;
      if (pageId is String) {
        pageIdInt = int.tryParse(pageId) ?? 0;
      } else if (pageId is int) {
        pageIdInt = pageId;
      } else {
        print("[navigatePage] Tipo de pageId inválido: ${pageId.runtimeType}");
        throw Exception("Tipo de pageId inválido: ${pageId.runtimeType}");
      }

      if (Get.isRegistered<DynamicJsonPageController>()) {
        final controller = Get.find<DynamicJsonPageController>();

        if (controller.pageID != pageIdInt) {
          controller.scaffoldData.value = null;
          Get.delete<DynamicJsonPageController>();

          final newController = DynamicJsonPageController(pageIdInt, client);
          Get.put(newController);

          try {
            await newController.loadJson(pageIdInt);
          } catch (e) {
            throw Exception("Erro durante a navegação: $e");
          }
        }
      } else {
        Get.put(DynamicJsonPageController(pageIdInt, client));

        try {
          await Get.to(
            () => DynamicJsonPageView(
              pageID: pageIdInt,
              skeleton: JsonCenter(child: JsonText("Carregando...")),
            ),
          );
        } catch (e) {
          throw Exception("Erro durante a navegação: $e");
        }
      }
    };
  }

  static JsonWidgetFunction _createSelectedIndexFunction() {
    return ({args, required registry}) => () async {
      final pageId = args?[0];
      if (pageId == null) {
        throw Exception("ID da página não fornecido.");
      }

      final url = Uri.parse(ApiConstants.getView(pageId));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data["json"] as Map<String, dynamic>;

        registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(jsonData, registry: registry),
            ),
          ),
        );
      } else {
        throw Exception("Erro ao carregar: ${response.statusCode}");
      }
    };
  }

  static JsonWidgetFunction _createShowDrawerFunction() {
    return ({args, required registry}) => () {
      final controller = Get.find<DynamicJsonPageController>();
      final bool id = args![0];
      controller.setRtl(id);
      controller.drawerController.showDrawer();
    };
  }

  static JsonWidgetFunction _createNavBarIndexFunction() {
    return ({args, required registry}) {
      if (args == null || args.length < 2) {
        return;
      }

      final String targetKey = args[0];
      final String sourceKey = args[1];
      final dynamic newIndex = registry.getValue(sourceKey);

      if (newIndex is int) {
        registry.setValue(targetKey, newIndex);
      }
    };
  }
}
