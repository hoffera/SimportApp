import "dart:convert";

import "package:get/get.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:re_editor/re_editor.dart";

class CodeJsonController extends GetxController {
  final String json;
  final String clientId;
  CodeJsonController({required this.json, required this.clientId});
  final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
  final codeController = CodeLineEditingController().obs;

  final debugController = CodeLineEditingController().obs;
  final skeletonController = CodeLineEditingController().obs;
  final parsedWidgets = Rxn<JsonWidgetData>();
  final debugWidgets = Rxn<JsonWidgetData>();
  final skeletonWidgets = Rxn<JsonWidgetData>();
  final individualComponents = <Widget>[].obs;

  final showIndividualComponents = false.obs;

  // Adicionar uma variável de loading
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    updateWidgetsFromJson(json);
  }

  // Novo método que apenas renderiza sem fazer atualizações
  Widget getCurrentWidgets(BuildContext context) {
    return parsedWidgets.value?.build(context: context, registry: registry) ??
        Container();
  }

  Widget getWidgets(BuildContext context) {
    isLoading.value = true;
    final widget = parseWidget(codeController.value.text);
    if (widget != null) {
      parsedWidgets.value = widget;
    }
    isLoading.value = false;
    return parsedWidgets.value?.build(context: context, registry: registry) ??
        Container();
  }

  Widget getDebugWidgets(BuildContext context) {
    return debugWidgets.value?.build(context: context, registry: registry) ??
        Container();
  }

  Widget getSkeletonWidgets(BuildContext context) {
    return skeletonWidgets.value?.build(context: context, registry: registry) ??
        Container();
  }

  void updateWidgetsFromJson(String jsonString) {
    final formattedJson = formatJson(jsonString);
    codeController.value.text = formattedJson;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final widget = parseWidget(codeController.value.text);
      if (widget != null) {
        parsedWidgets.value = widget;
        atualizarWidgets([widget]);
      }
    });
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

  JsonWidgetData? parseWidget(String text) {
    try {
      final trimmedText = text.trim();
      if (trimmedText.isEmpty) {
        debugPrint("Texto JSON está vazio");
        return null;
      }

      Map<String, dynamic> jsonData;

      try {
        jsonData = jsonDecode(trimmedText) as Map<String, dynamic>;
      } catch (e) {
        try {
          final wrappedText = "[$trimmedText]";
          final jsonList = jsonDecode(wrappedText) as List<dynamic>;
          if (jsonList.isNotEmpty) {
            jsonData = jsonList.first as Map<String, dynamic>;
          } else {
            debugPrint("Lista JSON está vazia");
            return null;
          }
        } catch (e2) {
          debugPrint("Erro ao parsear JSON: $e2");
          debugPrint("Formato esperado: objeto JSON ou array com um objeto");
          return null;
        }
      }

      Map<String, dynamic> widgetData;
      if (jsonData.containsKey("json")) {
        widgetData = jsonData["json"] as Map<String, dynamic>;
      } else {
        widgetData = jsonData;
      }

      return JsonWidgetData.fromDynamic(widgetData, registry: registry);
    } catch (e, stack) {
      debugPrint("Erro geral ao parsear/renderizar JSON: $e");
      debugPrint("Stack trace: $stack");
      return null;
    }
  }

  Map<String, dynamic> encapsulateWidgets(
    Map<String, dynamic> widgetJson,
    String widgetType, {
    Map<String, dynamic>? wrapperArgs,
  }) {
    try {
      if (widgetJson["type"] == "column" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenEncapsulated = children.map((child) {
          if (child["type"] == "column") {
            return encapsulateWidgets(
              child,
              widgetType,
              wrapperArgs: wrapperArgs,
            );
          } else {
            return _createWrapperWidget(
              child,
              widgetType,
              wrapperArgs: wrapperArgs,
            );
          }
        }).toList();

        return {
          "type": "column",
          "args": {"children": childrenEncapsulated},
        };
      }

      if (widgetJson["type"] == "single_child_scroll_view" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        return {
          "type": "single_child_scroll_view",
          "args": {"child": childEncapsulated},
        };
      }

      if (widgetJson["type"] == "safe_area" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        return {
          "type": "safe_area",
          "args": {
            "bottom": widgetJson["args"]["bottom"],
            "child": childEncapsulated,
          },
        };
      }

      if (widgetJson["type"] == "form" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        return {
          "type": "form",
          "args": {"child": childEncapsulated},
        };
      }

      if (widgetJson["type"] == "container" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};
        args.forEach((key, value) {
          if (key == "child") {
            newArgs[key] = childEncapsulated;
          } else {
            newArgs[key] = value;
          }
        });

        return {"type": "container", "args": newArgs};
      }

      if (widgetJson["type"] == "material" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};
        args.forEach((key, value) {
          if (key == "child") {
            newArgs[key] = childEncapsulated;
          } else {
            newArgs[key] = value;
          }
        });

        return {"type": "material", "args": newArgs};
      }

      if (widgetJson["type"] == "row" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenEncapsulated = children.map((child) {
          return encapsulateWidgets(
            child,
            widgetType,
            wrapperArgs: wrapperArgs,
          );
        }).toList();

        return {
          "type": "row",
          "args": {"children": childrenEncapsulated},
        };
      }

      if (widgetJson["type"] == "flexible" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        return {
          "type": "flexible",
          "args": {"child": childEncapsulated},
        };
      }

      if (widgetJson["type"] == "semantics" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};
        args.forEach((key, value) {
          if (key == "child") {
            newArgs[key] = childEncapsulated;
          } else {
            newArgs[key] = value;
          }
        });

        return {"type": "semantics", "args": newArgs};
      }

      if (widgetJson["type"] == "exclude_semantics" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        return {
          "type": "exclude_semantics",
          "args": {"child": childEncapsulated},
        };
      }

      if (widgetJson["type"] == "merge_semantics" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        return {
          "type": "merge_semantics",
          "args": {"child": childEncapsulated},
        };
      }

      if (widgetJson["type"] == "save_context" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childEncapsulated = encapsulateWidgets(
          child,
          widgetType,
          wrapperArgs: wrapperArgs,
        );

        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};
        args.forEach((key, value) {
          if (key == "child") {
            newArgs[key] = childEncapsulated;
          } else {
            newArgs[key] = value;
          }
        });

        return {"type": "save_context", "args": newArgs};
      }

      if (widgetJson["type"] == "default_app_bar" &&
          widgetJson.containsKey("args")) {
        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};
        args.forEach((key, value) {
          newArgs[key] = value;
        });

        debugPrint("DEBUG: Processando default_app_bar com args: $newArgs");

        // Se estamos encapsulando, aplicar o wrapper
        if (widgetType != "default_app_bar") {
          return _createWrapperWidget(
            {"type": "default_app_bar", "args": newArgs},
            widgetType,
            wrapperArgs: wrapperArgs,
          );
        }

        return {"type": "default_app_bar", "args": newArgs};
      }

      if (widgetJson["type"] == "default_drawer" &&
          widgetJson.containsKey("args")) {
        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};
        args.forEach((key, value) {
          newArgs[key] = value;
        });

        debugPrint("DEBUG: Processando default_drawer com args: $newArgs");

        // Se estamos encapsulando, aplicar o wrapper
        if (widgetType != "default_drawer") {
          return _createWrapperWidget(
            {"type": "default_drawer", "args": newArgs},
            widgetType,
            wrapperArgs: wrapperArgs,
          );
        }

        return {"type": "default_drawer", "args": newArgs};
      }

      if (widgetJson["type"] == "page_index" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenEncapsulated = children.map((child) {
          return encapsulateWidgets(
            child,
            widgetType,
            wrapperArgs: wrapperArgs,
          );
        }).toList();

        return {
          "type": "page_index",
          "args": {
            "index": widgetJson["args"]["index"],
            "children": childrenEncapsulated,
          },
        };
      }

      if (widgetJson["type"] == "scaffold" && widgetJson.containsKey("args")) {
        final args = widgetJson["args"] as Map<String, dynamic>;
        final newArgs = <String, dynamic>{};

        if (args.containsKey("appBar")) {
          final appBar = args["appBar"] as Map<String, dynamic>;
          final isDefaultAppBar = appBar["type"] == "default_app_bar";
          final isSkeletonOrDebug =
              widgetType == "skeleton_loading" ||
              widgetType == "button_json_widget";

          if (isDefaultAppBar && isSkeletonOrDebug) {
            debugPrint("DEBUG: Removendo default_app_bar para skeleton/debug");
          } else {
            debugPrint("DEBUG: Processando appBar no scaffold");
            newArgs["appBar"] = encapsulateWidgets(
              args["appBar"],
              widgetType,
              wrapperArgs: wrapperArgs,
            );
          }
        }

        if (args.containsKey("drawer")) {
          newArgs["drawer"] = encapsulateWidgets(
            args["drawer"],
            widgetType,
            wrapperArgs: wrapperArgs,
          );
        }

        if (args.containsKey("body")) {
          newArgs["body"] = encapsulateWidgets(
            args["body"],
            widgetType,
            wrapperArgs: wrapperArgs,
          );
        }

        args.forEach((key, value) {
          if (!["appBar", "drawer", "body"].contains(key)) {
            newArgs[key] = value;
          }
        });

        return {"type": "scaffold", "args": newArgs};
      }

      return widgetJson;
    } catch (e) {
      debugPrint("Erro ao encapsular widgets: $e");
      return widgetJson;
    }
  }

  Map<String, dynamic> _createWrapperWidget(
    Map<String, dynamic> child,
    String widgetType, {
    Map<String, dynamic>? wrapperArgs,
    String? id,
  }) {
    switch (widgetType) {
      case "button_json_widget":
        return {
          "type": "button_json_widget",
          "args": {
            "child": child,
            "widgetJson": jsonEncode(child),
            ...?wrapperArgs,
          },
        };

      case "skeleton_loading":
        return {
          "type": "skeleton_loading",
          "args": {"child": child, ...?wrapperArgs},
        };

      case "widget_with_id":
        return {
          "type": "widget_with_id",
          "args": {"child": child, "id": id!, ...?wrapperArgs},
        };

      default:
        return child;
    }
  }

  String atualizarWidgets(List<JsonWidgetData> widgets) {
    try {
      if (widgets.isEmpty) {
        return "Nenhum widget encontrado";
      }

      final widget = widgets.first;
      final widgetJson = widget.toJson();

      final debugJson = encapsulateWidgets(widgetJson, "button_json_widget");
      final skeletonJson = encapsulateWidgets(widgetJson, "skeleton_loading");

      const encoder = JsonEncoder.withIndent("  ");
      final formattedDebugJson = encoder.convert(debugJson);
      final formattedSkeletonJson = encoder.convert(skeletonJson);

      debugController.value.text = formattedDebugJson;
      skeletonController.value.text = formattedSkeletonJson;

      final debugWidgets = parseWidget(formattedDebugJson);
      if (debugWidgets != null) {
        this.debugWidgets.value = debugWidgets;
      }
      final skeletonWidgets = parseWidget(formattedSkeletonJson);
      if (skeletonWidgets != null) {
        this.skeletonWidgets.value = skeletonWidgets;
      }

      return "Sucesso";
    } catch (e) {
      return "Erro ao gerar JSON de debug: $e";
    }
  }

  void resetControllers() {
    codeController.value.text = "";
    debugController.value.text = "";
    skeletonController.value.text = "";
    parsedWidgets.value = null;
    individualComponents.clear();
    skeletonWidgets.value = null;
    debugWidgets.value = null;
    updateWidgetsFromJson(json);
  }
}
