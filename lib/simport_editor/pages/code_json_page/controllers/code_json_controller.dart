import "dart:convert";

import "package:flutter_code_editor/flutter_code_editor.dart";
import "package:get/get.dart";
import "package:highlight/languages/json.dart" as mode;
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CodeJsonController extends GetxController {
  final String json;
  final String clientId;
  CodeJsonController({required this.json, required this.clientId});
  final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
  final codeController = CodeController(text: "", language: mode.json).obs;
  final debugController = CodeController(text: "", language: mode.json).obs;
  final parsedWidgets = <JsonWidgetData>[].obs;
  final individualComponents = <Widget>[].obs;
  final skeletonWidgets = <JsonWidgetData>[].obs;

  ThemeData? appTheme;
  final showIndividualComponents = false.obs;

  @override
  void onInit() {
    super.onInit();
    updateWidgetsFromJson(json);

    codeController.value.addListener(() {
      final widgets = parseWidgets(codeController.value.text);
      if (widgets != null) {
        parsedWidgets.assignAll(widgets);
      }
    });

    // Adicionar listener para atualizar skeleton loading quando o debug JSON mudar
    debugController.value.addListener(() {
      final widgets = parseWidgets(debugController.value.text);
      if (widgets != null) {
        skeletonWidgets.assignAll(widgets);
      } else {
        skeletonWidgets.clear();
      }
    });
  }

  void updateWidgetsFromJson(String jsonString) {
    final formattedJson = formatJson(jsonString);
    codeController.value.text = formattedJson;
    final widgets = parseWidgets(codeController.value.text);
    if (widgets != null) {
      parsedWidgets.assignAll(widgets);
    }
  }

  String formatJson(String jsonString) {
    try {
      final trimmedJson = jsonString.trim();

      final jsonData = jsonDecode(trimmedJson);

      const encoder = JsonEncoder.withIndent("  ");

      return encoder.convert(jsonData);
    } catch (e) {
      debugPrint("Erro ao formatar JSON: $e");
      return jsonString;
    }
  }

  List<JsonWidgetData>? parseWidgets(String text) {
    try {
      final trimmedText = text.trim();
      if (trimmedText.isEmpty) {
        debugPrint("Texto JSON está vazio");
        return null;
      }

      List<dynamic> jsonList;

      try {
        jsonList = jsonDecode(trimmedText) as List<dynamic>;
      } catch (e) {
        try {
          final wrappedText = "[$trimmedText]";
          jsonList = jsonDecode(wrappedText) as List<dynamic>;
        } catch (e2) {
          try {
            final singleObject =
                jsonDecode(trimmedText) as Map<String, dynamic>;
            jsonList = [singleObject];
          } catch (e3) {
            debugPrint("Erro ao parsear JSON: $e3");
            debugPrint(
              "Formato esperado: array de objetos JSON ou objeto único",
            );
            return null;
          }
        }
      }

      final widgets = jsonList
          .map<JsonWidgetData?>((item) {
            try {
              Map<String, dynamic> widgetData;
              if (item is Map<String, dynamic> && item.containsKey("json")) {
                widgetData = item["json"] as Map<String, dynamic>;
              } else if (item is Map<String, dynamic>) {
                widgetData = item;
              } else {
                debugPrint("Item não é um objeto válido: $item");
                return null;
              }

              return JsonWidgetData.fromDynamic(widgetData, registry: registry);
            } catch (e) {
              debugPrint("Erro ao processar widget: $e");
              return null;
            }
          })
          .where((widget) => widget != null)
          .cast<JsonWidgetData>()
          .toList();

      if (widgets.isEmpty) {
        debugPrint("Nenhum widget válido encontrado no JSON");
        return null;
      }

      return widgets;
    } catch (e, stack) {
      debugPrint("Erro geral ao parsear/renderizar JSON: $e");
      debugPrint("Stack trace: $stack");
      return null;
    }
  }

  String generateDebugJson(List<JsonWidgetData> widgets) {
    try {
      if (widgets.isEmpty) {
        return "Nenhum widget encontrado";
      }

      final widget = widgets.first;
      final widgetJson = widget.toJson();
      final bordersJson = generateBordersJson(widgetJson);

      const encoder = JsonEncoder.withIndent("  ");
      final debugJson = encoder.convert(bordersJson);

      // Atualizar o debug controller e skeleton widgets
      debugController.value.text = debugJson;
      final skeletonWidgets = parseWidgets(debugJson);
      if (skeletonWidgets != null) {
        this.skeletonWidgets.assignAll(skeletonWidgets);
      }

      return debugJson;
    } catch (e) {
      return "Erro ao gerar JSON de debug: $e";
    }
  }

  Map<String, dynamic> generateBordersJson(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "page_index" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWithBorders = children.map((child) {
          return addBordersToWidgetJson(child);
        }).toList();

        return {
          "type": "page_index",
          "args": {
            "index": widgetJson["args"]["index"],
            "children": childrenWithBorders,
          },
        };
      } else if (widgetJson["type"] == "single_child_scroll_view") {
        return addBordersToWidgetJson(widgetJson);
      }

      return widgetJson;
    } catch (e) {
      return widgetJson;
    }
  }

  Map<String, dynamic> addBordersToWidgetJson(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "single_child_scroll_view" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childWithBorders = addButtonJsonModal(child);

        return {
          "type": "single_child_scroll_view",
          "args": {"child": childWithBorders},
        };
      }

      return widgetJson;
    } catch (e) {
      return widgetJson;
    }
  }

  Map<String, dynamic> addSkeletonLoading(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "single_child_scroll_view" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childWithBorders = skeletonJson(child);

        return {
          "type": "single_child_scroll_view",
          "args": {"child": childWithBorders},
        };
      }

      return widgetJson;
    } catch (e) {
      return widgetJson;
    }
  }

  Map<String, dynamic> addButtonJsonModal(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "column" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWithBorders = children.map((child) {
          if (child["type"] == "column") {
            return addButtonJsonModal(child);
          } else {
            return {
              "type": "button_json_widget",
              "args": {"child": child, "widgetJson": jsonEncode(child)},
            };
          }
        }).toList();

        return {
          "type": "column",
          "args": {"children": childrenWithBorders},
        };
      }

      return widgetJson;
    } catch (e) {
      return widgetJson;
    }
  }

  Map<String, dynamic> skeletonJson(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "column" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWithBorders = children.map((child) {
          if (child["type"] == "column") {
            return skeletonJson(child);
          } else {
            return {
              "type": "skeleton_loading",
              "args": {"child": child},
            };
          }
        }).toList();

        return {
          "type": "column",
          "args": {"children": childrenWithBorders},
        };
      }

      return widgetJson;
    } catch (e) {
      return widgetJson;
    }
  }
}
