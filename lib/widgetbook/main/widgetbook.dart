import "dart:convert";

import "package:device_frame/device_frame.dart";
import "package:flutter_code_editor/flutter_code_editor.dart";
import "package:flutter_highlight/themes/an-old-hope.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:heroicons/heroicons.dart";
import "package:highlight/languages/json.dart" as mode;
import "package:json_app/app/components/custom_widget_registrar.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/app/json dynamic widget/register/register_functions.dart";
import "package:json_app/app/theme/app_theme.dart";
import "package:json_app/widgetbook/main/widgetbook.directories.g.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:widgetbook/widgetbook.dart" hide Devices;
import "package:widgetbook_annotation/widgetbook_annotation.dart" as widgetbook;

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

void main() async {
  registry.navigatorKey = GlobalKey<NavigatorState>();

  CustomWidgetRegistrar.registerDefaults(registry: registry);

  RegisterFunctions.registerAllFunctions(registry);

  WidgetsFlutterBinding.ensureInitialized();
  final appTheme = AppTheme();
  await appTheme.loadThemes();
  runApp(WidgetBookApp(appTheme: appTheme));
}

@widgetbook.App(
  cloudAddonsConfigs: {
    "iPhone 13": [ViewportAddonConfig(IosViewports.iPhone13)],
    "iPhone 12": [ViewportAddonConfig(IosViewports.iPhone12)],
  },
)
class WidgetBookApp extends StatefulWidget {
  final AppTheme appTheme;
  const WidgetBookApp({super.key, required this.appTheme});

  @override
  State<WidgetBookApp> createState() => _WidgetBookAppState();
}

class _WidgetBookAppState extends State<WidgetBookApp> {
  final codeController = CodeController(text: "", language: mode.json);

  List<JsonWidgetData>? parsedWidgets;
  final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

  @override
  void initState() {
    super.initState();

    codeController.text = '''[
{
            "type": "text",
            "args": {
              "text": "Teste"
            }}
]''';
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

  void _onParsePressed() {
    final widgets = _parseWidgets(codeController.text);
    setState(() {
      parsedWidgets = widgets;
    });
  }

  bool showPreview = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("pt", "BR"),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("pt", "BR")],
      home: Scaffold(
        backgroundColor: Color.fromRGBO(26, 28, 30, 1),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      "Simport Widgetbook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),

                    if (showPreview)
                      IconButton.outlined(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            parsedWidgets != null && parsedWidgets!.isNotEmpty
                                ? Colors.green.withOpacity(0.2)
                                : Colors.transparent,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            parsedWidgets != null && parsedWidgets!.isNotEmpty
                                ? Colors.green
                                : AppColors.contentColorWhite,
                          ),
                        ),
                        onPressed: _onParsePressed,
                        icon: HeroIcon(
                          parsedWidgets != null && parsedWidgets!.isNotEmpty
                              ? HeroIcons.check
                              : HeroIcons.play,
                          style: HeroIconStyle.solid,
                        ),
                      ),
                    if (showPreview) const SizedBox(width: 8),

                    if (showPreview)
                      IconButton.outlined(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            AppColors.contentColorWhite,
                          ),
                        ),
                        onPressed: () {
                          codeController.clear();
                          setState(() {
                            parsedWidgets = null;
                          });
                        },
                        icon: HeroIcon(
                          HeroIcons.trash,
                          style: HeroIconStyle.solid,
                        ),
                      ),
                    if (showPreview) const SizedBox(width: 8),

                    IconButton.outlined(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          showPreview ? AppColors.primary : Colors.transparent,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          AppColors.contentColorWhite,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          showPreview = !showPreview;
                        });
                      },
                      icon: HeroIcon(
                        showPreview ? HeroIcons.xMark : HeroIcons.codeBracket,
                        style: HeroIconStyle.solid,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: showPreview
                    ? _buildJsonViewerLayout()
                    : _buildWidgetbookLayout(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetbookLayout() {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: "Light", data: widget.appTheme.light),
            WidgetbookTheme(name: "Dark", data: widget.appTheme.dark),
          ],
        ),
        ViewportAddon([IosViewports.iPhone13, IosViewports.iPhone12]),
        InspectorAddon(),
        GridAddon(100),
        ZoomAddon(),
      ],
    );
  }

  Widget _buildJsonViewerLayout() {
    return Row(
      children: [
        /// Editor de Código
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

        /// Visualização do JSON
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
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: DeviceFrame(
                    device: Devices.ios.iPhone13,
                    screen: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: widget.appTheme.light,

                      home: Builder(
                        builder: (context) {
                          try {
                            return Scaffold(
                              body: parsedWidgets != null
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
