import "dart:convert";

import "package:device_frame/device_frame.dart" show DeviceFrame, Devices;
import "package:device_frame/device_frame.dart";
import "package:flutter_code_editor/flutter_code_editor.dart";
import "package:flutter_highlight/themes/an-old-hope.dart";
import "package:go_router/go_router.dart";
import "package:highlight/languages/json.dart" as mode;
import "package:json_app/simport_editor/widgets/button_json_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

class CodeJsonPage extends StatefulWidget {
  final String json;
  final String clientId;
  const CodeJsonPage({super.key, required this.json, required this.clientId});

  @override
  State<CodeJsonPage> createState() => _CodeJsonPageState();
}

class _CodeJsonPageState extends State<CodeJsonPage> {
  final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
  final codeController = CodeController(text: "", language: mode.json);
  final debugController = CodeController(text: "", language: mode.json);
  List<JsonWidgetData>? parsedWidgets;
  List<Widget>? individualComponents;
  ThemeData? appTheme;
  bool showIndividualComponents = false;

  @override
  void initState() {
    super.initState();

    final formattedJson = _formatJson(widget.json);
    codeController.text = formattedJson;
    final widgets = _parseWidgets(codeController.text);
    setState(() {
      parsedWidgets = widgets;
    });
  }

  String _formatJson(String jsonString) {
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

  List<JsonWidgetData>? _parseWidgets(String text) {
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

  List<Widget> _addRedBordersToChildWidgets(List<JsonWidgetData> widgets) {
    return widgets.map((widgetData) {
      return _buildWidgetWithDeepChildBorders(widgetData);
    }).toList();
  }

  String _generateDebugJson(List<JsonWidgetData> widgets) {
    try {
      if (widgets.isEmpty) {
        return "Nenhum widget encontrado";
      }

      final widget = widgets.first;
      final widgetJson = widget.toJson();
      final bordersJson = _generateBordersJson(widgetJson);

      const encoder = JsonEncoder.withIndent("  ");
      return encoder.convert(bordersJson);
    } catch (e) {
      return "Erro ao gerar JSON de debug: $e";
    }
  }

  Map<String, dynamic> _generateBordersJson(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "page_index" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWithBorders = children.map((child) {
          return _addBordersToWidgetJson(child);
        }).toList();

        return {
          "type": "page_index",
          "args": {
            "index": widgetJson["args"]["index"],
            "children": childrenWithBorders,
          },
        };
      } else if (widgetJson["type"] == "single_child_scroll_view") {
        return _addBordersToWidgetJson(widgetJson);
      }

      return widgetJson;
    } catch (e) {
      return widgetJson;
    }
  }

  Map<String, dynamic> _addBordersToWidgetJson(
    Map<String, dynamic> widgetJson,
  ) {
    try {
      if (widgetJson["type"] == "single_child_scroll_view" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childWithBorders = _addButtonJsonModal(child);

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

  Map<String, dynamic> _addSkeletonLoading(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "single_child_scroll_view" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["child"] != null) {
        final child = widgetJson["args"]["child"];
        final childWithBorders = _skeletonJson(child);

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

  Map<String, dynamic> _addButtonJsonModal(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "column" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWithBorders = children.map((child) {
          if (child["type"] == "column") {
            return _addButtonJsonModal(child);
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

  Map<String, dynamic> _skeletonJson(Map<String, dynamic> widgetJson) {
    try {
      if (widgetJson["type"] == "column" &&
          widgetJson.containsKey("args") &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWithBorders = children.map((child) {
          if (child["type"] == "column") {
            return _skeletonJson(child);
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

  Widget _widgetButton(Widget child, String widgetJson) {
    return ButtonJsonWidget(widgetJson: widgetJson, child: child);
  }

  Widget _buildWidgetWithDeepChildBorders(JsonWidgetData widgetData) {
    try {
      final widget = widgetData.build(context: context, registry: registry);

      if (widget is Column) {
        final widgetJson = widgetData.toJson();
        final children = widgetJson["args"]["children"] as List;

        return Column(
          children: (widget).children.asMap().entries.map((entry) {
            final index = entry.key;
            final child = entry.value;
            final childJson = children[index];
            return _widgetButton(child, jsonEncode(childJson));
          }).toList(),
        );
      } else if (widget is SingleChildScrollView) {
        final scrollView = widget;
        if (scrollView.child is Column) {
          final column = scrollView.child as Column;
          return SingleChildScrollView(
            child: Column(
              children: column.children.map((child) {
                if (child is Column) {
                  return Column(
                    children: child.children.map((grandChild) {
                      return _widgetButton(
                        grandChild,
                        widgetData.toJson().toString(),
                      );
                    }).toList(),
                  );
                } else {
                  return _widgetButton(child, widgetData.toJson().toString());
                }
              }).toList(),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: _widgetButton(
              scrollView.child!,
              widgetData.toJson().toString(),
            ),
          );
        }
      } else {
        // Para outros tipos de widgets (como page_index), vamos tentar navegar nos children
        return _buildWidgetWithChildrenBorders(widgetData);
      }
    } catch (e) {
      debugPrint("Erro ao adicionar bordas aos child widgets: $e");
      return widgetData.build(context: context, registry: registry);
    }
  }

  Widget _buildWidgetWithChildrenBorders(JsonWidgetData widgetData) {
    try {
      final widgetJson = widgetData.toJson();

      if (widgetJson.containsKey("args") &&
          widgetJson["args"] is Map<String, dynamic> &&
          widgetJson["args"]["children"] is List) {
        final children = widgetJson["args"]["children"] as List;
        final childrenWidgets = children.map((childJson) {
          try {
            final childWidgetData = JsonWidgetData.fromDynamic(
              childJson,
              registry: registry,
            );
            return _buildWidgetWithDeepChildBorders(childWidgetData);
          } catch (e) {
            debugPrint("Erro ao processar child widget: $e");
            return Container();
          }
        }).toList();

        return Column(children: childrenWidgets);
      }

      return widgetData.build(context: context, registry: registry);
    } catch (e) {
      debugPrint("Erro ao processar widget com children: $e");
      return widgetData.build(context: context, registry: registry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: IconButton(
          icon: const Icon(Icons.arrow_back, size: 40),
          tooltip: "Voltar",
          onPressed: () {
            context.go("/editor-client/${widget.clientId}");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility, size: 40),
            tooltip: "Vizualizar componentes individuais",
            onPressed: () {
              final widgets = _parseWidgets(codeController.text);
              setState(() {
                parsedWidgets = widgets;
                individualComponents = widgets != null
                    ? _addRedBordersToChildWidgets(widgets)
                    : null;
              });

              showIndividualComponents = !showIndividualComponents;
            },
          ),
          IconButton(
            icon: const Icon(Icons.format_indent_increase, size: 40),
            tooltip: "Reformatar JSON",
            onPressed: () {
              final formattedJson = _formatJson(codeController.text);
              codeController.text = formattedJson;

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("JSON reformatado com sucesso!"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow, size: 40),
            tooltip: "Renderizar JSON",
            onPressed: () {
              final widgets = _parseWidgets(codeController.text);
              setState(() {
                parsedWidgets = widgets;
                individualComponents = widgets != null
                    ? _addRedBordersToChildWidgets(widgets)
                    : null;
              });

              if (widgets != null) {
                final debugJson = _generateDebugJson(widgets);
                debugController.text = debugJson;
              }

              if (widgets != null && widgets.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("JSON renderizado com sucesso!"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Erro ao renderizar JSON. Verifique o formato.",
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Editor JSON",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    child: CodeTheme(
                      data: CodeThemeData(styles: anOldHopeTheme),
                      child: SingleChildScrollView(
                        child: CodeField(
                          controller: codeController,
                          minLines: 40,
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Preview",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13,
                      screen: Builder(
                        builder: (context) {
                          try {
                            return Scaffold(
                              body: showIndividualComponents == false
                                  ? SafeArea(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: parsedWidgets!
                                              .map(
                                                (widgetData) => Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                      ),
                                                  child: widgetData.build(
                                                    context: context,
                                                    registry: registry,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    )
                                  : SafeArea(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: individualComponents!,
                                        ),
                                      ),
                                    ),
                            );
                          } catch (e, stack) {
                            debugPrint("Erro na renderização: $e\n$stack");
                            return Scaffold(
                              body: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      size: 64,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Erro ao renderizar widget",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Detalhes: $e",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Debug JSON",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    child: CodeTheme(
                      data: CodeThemeData(styles: anOldHopeTheme),
                      child: SingleChildScrollView(
                        child: CodeField(
                          controller: debugController,
                          minLines: 40,
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Skeleton Loading",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13,
                      screen: Builder(
                        builder: (context) {
                          try {
                            // Parse the debug JSON to render skeleton loading
                            final skeletonWidgets = _parseWidgets(
                              debugController.text,
                            );

                            return Scaffold(
                              body:
                                  skeletonWidgets != null &&
                                      skeletonWidgets.isNotEmpty
                                  ? SafeArea(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: skeletonWidgets
                                              .map(
                                                (widgetData) => Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                      ),
                                                  child: widgetData.build(
                                                    context: context,
                                                    registry: registry,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    )
                                  : const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.code,
                                            size: 64,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            "Cole os widgets JSON no editor",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Use o botão ▶️ para renderizar",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            );
                          } catch (e, stack) {
                            debugPrint("Erro na renderização: $e\n$stack");
                            return Scaffold(
                              body: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      size: 64,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Erro ao renderizar widget",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Detalhes: $e",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
