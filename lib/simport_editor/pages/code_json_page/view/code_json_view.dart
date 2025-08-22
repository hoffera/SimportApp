import "dart:convert";

import "package:device_frame/device_frame.dart";
import "package:flutter_code_editor/flutter_code_editor.dart";
import "package:flutter_highlight/themes/an-old-hope.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:json_app/simport_editor/pages/code_json_page/controllers/code_json_controller.dart";
import "package:json_app/simport_editor/widgets/button_json_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CodeJsonPageView extends GetView<CodeJsonController> {
  const CodeJsonPageView({super.key});

  Widget _widgetButton(Widget child, String widgetJson) {
    return ButtonJsonWidget(widgetJson: widgetJson, child: child);
  }

  Widget _buildWidgetWithDeepChildBorders(
    JsonWidgetData widgetData,
    BuildContext context,
  ) {
    try {
      final widget = widgetData.build(
        context: context,
        registry: controller.registry,
      );

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
              children: column.children.asMap().entries.map((entry) {
                final index = entry.key;
                final child = entry.value;
                final widgetJson = widgetData.toJson();
                final children = widgetJson["args"]["children"] as List;
                final childJson = children[index];

                if (child is Column) {
                  return Column(
                    children: child.children.asMap().entries.map((grandEntry) {
                      final grandIndex = grandEntry.key;
                      final grandChild = grandEntry.value;
                      final grandChildren =
                          childJson["args"]["children"] as List;
                      final grandChildJson = grandChildren[grandIndex];
                      return _widgetButton(
                        grandChild,
                        jsonEncode(grandChildJson),
                      );
                    }).toList(),
                  );
                } else {
                  return _widgetButton(child, jsonEncode(childJson));
                }
              }).toList(),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: _widgetButton(
              scrollView.child!,
              jsonEncode(widgetData.toJson()["args"]["child"]),
            ),
          );
        }
      } else {
        return _buildWidgetWithChildrenBorders(widgetData, context);
      }
    } catch (e) {
      debugPrint("Erro ao adicionar bordas aos child widgets: $e");
      return widgetData.build(context: context, registry: controller.registry);
    }
  }

  Widget _buildWidgetWithChildrenBorders(
    JsonWidgetData widgetData,
    BuildContext context,
  ) {
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
              registry: controller.registry,
            );
            return _buildWidgetWithDeepChildBorders(childWidgetData, context);
          } catch (e) {
            debugPrint("Erro ao processar child widget: $e");
            return Container();
          }
        }).toList();

        return Column(children: childrenWidgets);
      }

      return widgetData.build(context: context, registry: controller.registry);
    } catch (e) {
      debugPrint("Erro ao processar widget com children: $e");
      return widgetData.build(context: context, registry: controller.registry);
    }
  }

  List<Widget> _addRedBordersToChildWidgets(
    List<JsonWidgetData> widgets,
    BuildContext context,
  ) {
    return widgets.map((widgetData) {
      return _buildWidgetWithDeepChildBorders(widgetData, context);
    }).toList();
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
            context.go("/editor-client/${controller.clientId}");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility, size: 40),
            tooltip: "Visualizar componentes individuais",
            onPressed: () {
              final widgets = controller.parseWidgets(
                controller.codeController.value.text,
              );

              if (widgets != null) {
                controller.parsedWidgets.assignAll(widgets);
                controller.individualComponents.assignAll(
                  _addRedBordersToChildWidgets(widgets, context),
                );
              }

              controller.showIndividualComponents.value =
                  !controller.showIndividualComponents.value;

              // Forçar atualização da UI
              controller.update();
            },
          ),
          IconButton(
            icon: const Icon(Icons.format_indent_increase, size: 40),
            tooltip: "Reformatar JSON",
            onPressed: () {
              final formattedJson = controller.formatJson(
                controller.codeController.value.text,
              );
              controller.codeController.value.text = formattedJson;

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
              final widgets = controller.parseWidgets(
                controller.codeController.value.text,
              );

              if (widgets != null) {
                controller.parsedWidgets.assignAll(widgets);
                controller.individualComponents.assignAll(
                  _addRedBordersToChildWidgets(widgets, context),
                );
                controller.generateDebugJson(widgets);
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

                  // Expanded(
                  //   child: CodeTheme(
                  //     data: CodeThemeData(styles: anOldHopeTheme),
                  //     child: SingleChildScrollView(
                  //       child: CodeField(
                  //         controller: controller.codeController.value,
                  //         minLines: 40,
                  //         textStyle: const TextStyle(fontSize: 14),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: MonacoEditorWidget(
                      controller: controller.codeController.value,
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
                              body:
                                  controller.showIndividualComponents.value ==
                                      false
                                  ? SafeArea(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Obx(
                                              () =>
                                                  controller
                                                      .parsedWidgets
                                                      .isNotEmpty
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: controller
                                                          .parsedWidgets
                                                          .map(
                                                            (
                                                              widgetData,
                                                            ) => Padding(
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                    vertical: 8,
                                                                  ),
                                                              child: widgetData.build(
                                                                context:
                                                                    context,
                                                                registry:
                                                                    controller
                                                                        .registry,
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                    )
                                                  : const Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.code,
                                                            size: 64,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(height: 16),
                                                          Text(
                                                            "JSON carregado com sucesso!",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SafeArea(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Obx(
                                              () => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: controller
                                                    .individualComponents,
                                              ),
                                            ),
                                          ],
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
                          controller: controller.debugController.value,
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
            flex: 1,
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
                            return Scaffold(
                              body: Obx(() {
                                if (controller.skeletonWidgets.isNotEmpty) {
                                  return SafeArea(
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: controller.skeletonWidgets
                                            .map(
                                              (widgetData) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                    ),
                                                child: widgetData.build(
                                                  context: context,
                                                  registry: controller.registry,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
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
                                  );
                                }
                              }),
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
