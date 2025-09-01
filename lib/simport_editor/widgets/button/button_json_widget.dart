import "dart:convert";

import "package:get/get.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/simport_editor/widgets/code_editor/code_editor_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";
import "package:re_editor/re_editor.dart";

part "button_json_widget.g.dart";

@jsonWidget
abstract class _ButtonJsonWidgetBuilder extends JsonWidgetBuilder {
  const _ButtonJsonWidgetBuilder({required super.args});

  @override
  ButtonJsonWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class ButtonJsonWidget extends StatefulWidget {
  const ButtonJsonWidget({
    super.key,
    required this.child,
    required this.widgetJson,
  });
  final Widget child;
  final String widgetJson;

  @override
  State<ButtonJsonWidget> createState() => _ButtonJsonWidgetState();
}

class _ButtonJsonWidgetState extends State<ButtonJsonWidget> {
  /// Formata o JSON para exibição legível
  String formatJson(String jsonString) {
    try {
      final trimmedJson = jsonString.trim();
      final jsonData = jsonDecode(trimmedJson);
      const encoder = JsonEncoder.withIndent("  ");
      return encoder.convert(jsonData);
    } catch (e) {
      debugPrint("formatJson: Erro ao formatar JSON: $e");
      return jsonString;
    }
  }

  /// Faz o parse de um único widget JSON e retorna um [JsonWidgetData]
  JsonWidgetData? parseWidget(String jsonString) {
    try {
      final trimmedJson = jsonString.trim();
      if (trimmedJson.isEmpty) {
        debugPrint("parseWidget: JSON está vazio");
        return null;
      }
      final Map<String, dynamic> jsonMap =
          jsonDecode(trimmedJson) as Map<String, dynamic>;
      return JsonWidgetData.fromDynamic(jsonMap);
    } catch (e) {
      debugPrint("parseWidget: Erro ao parsear JSON: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final codeController = CodeLineEditingController();
    final parsedWidget = Rxn<JsonWidgetData>();

    // Inicializa o editor com o JSON formatado
    final formattedJson = formatJson(widget.widgetJson);
    codeController.text = formattedJson;

    // Listener para atualizar o widget ao editar o JSON
    codeController.addListener(() {
      final formattedJson = formatJson(codeController.text);
      codeController.text = formattedJson;
      parsedWidget.value = parseWidget(formattedJson);
    });

    // Inicializa o widget parseado na primeira renderização
    parsedWidget.value = parseWidget(formattedJson);

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return Dialog(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: codeController.text),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "JSON copiado para a área de transferência!",
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          tooltip: "Copiar JSON",
                        ),

                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            codeController.text = formatJson(widget.widgetJson);
                            parsedWidget.value = parseWidget(
                              codeController.text,
                            );
                            Navigator.of(dialogContext).pop();
                          },
                          tooltip: "Fechar",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CodeEditorWidget(controller: codeController),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Obx(
                              () => Box(
                                style: Style(
                                  $box.color.white(),
                                  $box.borderRadius.all(20),
                                  $box.padding.all(20),
                                  $box.color.white(),
                                  $box.border.all(color: AppColors.primary),
                                  $box.elevation(1),
                                ),
                                child: Center(
                                  child: parsedWidget.value!.build(
                                    context: context,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 0.5),
        ),
        child: AbsorbPointer(child: widget.child),
      ),
    );
  }
}
