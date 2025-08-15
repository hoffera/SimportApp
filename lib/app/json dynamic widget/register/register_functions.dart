import "dart:convert";

import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart";
import "package:json_app/app/pages/home_json_screen_page/views/full_widget_page.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class RegisterFunctions {
  static void registerAllFunctions(JsonWidgetRegistry registry) {
    registry.registerFunctions({
      "navigatePage": _createNavigatePageFunction(),
      "selectedIndex": _createSelectedIndexFunction(),
      "navigate": _createNavigateFunction(),
      "showDrawer": _createShowDrawerFunction(),
      "navBarIndex": _createNavBarIndexFunction(),
    });

    registry.setValue("currentPageIndex", 0);
  }

  static JsonWidgetFunction _createNavigatePageFunction() {
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

  static JsonWidgetFunction _createNavigateFunction() {
    return ({args, required registry}) => () async {
      final String id = args![0];
      final url = Uri.parse("https://687fa87cefe65e52008a8cfe.mockapi.io/$id");
      final response = await http.get(Uri.parse("$url"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(data.first, registry: registry),
            ),
          ),
        );
      } else {
        print("Erro ao buscar o bin: ${response.statusCode}");
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
