import "package:json_dynamic_widget/json_dynamic_widget.dart";

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

class ButtonJsonWidget extends StatelessWidget {
  const ButtonJsonWidget({
    super.key,
    required this.child,
    required this.widgetJson,
  });
  final Widget child;
  final String widgetJson;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Widget JSON",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: widgetJson),
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
                                Navigator.of(dialogContext).pop();
                              },
                              tooltip: "Fechar",
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: TextEditingController(text: widgetJson),
                          maxLines: null,
                          expands: true,
                          style: const TextStyle(
                            fontFamily: "monospace",
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                            hintText: "JSON do widget...",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                          child: const Text("Cancelar"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Aqui você pode adicionar lógica para aplicar as mudanças
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Funcionalidade de edição será implementada!",
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Text("Aplicar Mudanças"),
                        ),
                      ],
                    ),
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
        child: AbsorbPointer(child: child),
      ),
    );
  }
}
