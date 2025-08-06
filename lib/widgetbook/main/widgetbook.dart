import "dart:convert";

import "package:device_frame/device_frame.dart";
import "package:flutter_code_editor/flutter_code_editor.dart";
import "package:flutter_highlight/themes/an-old-hope.dart";
import "package:get/get.dart";
import "package:heroicons/heroicons.dart";
import "package:highlight/languages/json.dart" as mode;
import "package:http/http.dart" as http;
import "package:json_app/app/components/custom_widget_registrar.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart";
import "package:json_app/app/pages/home_json_screen_page/views/full_widget_page.dart";
import "package:json_app/app/theme/app_theme.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_app/widgetbook/main/widgetbook.directories.g.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";
import "package:widgetbook/widgetbook.dart" hide Devices;
import "package:widgetbook_annotation/widgetbook_annotation.dart" as widgetbook;

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
void main() async {
  registry.navigatorKey = GlobalKey<NavigatorState>();

  CustomWidgetRegistrar.registerDefaults(registry: registry);

  registry.registerFunction("navigatePage", ({args, required registry}) {
    return () async {
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
  });

  registry.registerFunction("selectedIndex", ({args, required registry}) {
    return () async {
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
  });

  registry.registerFunction(
    "navigate",
    ({args, required registry}) => () async {
      final String id = args![0];
      final url = Uri.parse("https://687fa87cefe65e52008a8cfe.mockapi.io/$id");

      final response = await http.get(Uri.parse("$url"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(
                data.first, // ou data[0]
                registry: registry,
              ),
            ),
          ),
        );
      } else {
        print("Erro ao buscar o bin: ${response.statusCode}");
      }
    },
  );

  registry.registerFunction(
    "showDrawer",
    ({args, required registry}) => () {
      final controller = Get.find<DynamicJsonPageController>();

      final bool id = args![0];
      controller.setRtl(id);
      controller.drawerController.showDrawer();
    },
  );
  registry.setValue("currentPageIndex", 0);
  registry.registerFunction("navBarIndex", ({args, required registry}) {
    if (args == null || args.length < 2) {
      return;
    }

    final String targetKey = args[0];
    final String sourceKey = args[1];

    final dynamic newIndex = registry.getValue(sourceKey);

    if (newIndex is int) {
      registry.setValue(targetKey, newIndex);
    }
  });
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
  final codeController = CodeController(
    text: "",
    language: mode.json,
    analyzer: const DefaultLocalAnalyzer(),
    modifiers: [const IndentModifier()],
  );

  late List<JsonWidgetData>? parsedWidgets;
  final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

  @override
  void initState() {
    super.initState();
  }

  List<JsonWidgetData>? _parseWidgets(String text) {
    try {
      final wrappedText = "[${text.trim()}]";

      final List<dynamic> jsonList = jsonDecode(wrappedText);

      return jsonList
          .map((e) => JsonWidgetData.fromDynamic(e))
          .whereType<JsonWidgetData>()
          .toList();
    } catch (e, stack) {
      debugPrint("Erro ao parsear/renderizar JSON: $e\n$stack");
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(26, 28, 30, 1),
        body: Row(
          children: [
            /// Widgetbook Viewer
            Expanded(
              flex: 6,
              child: Widgetbook.material(
                directories: directories,
                addons: [
                  MaterialThemeAddon(
                    themes: [
                      WidgetbookTheme(
                        name: "Light",
                        data: widget.appTheme.light,
                      ),
                      WidgetbookTheme(name: "Dark", data: widget.appTheme.dark),
                    ],
                  ),
                  ViewportAddon([IosViewports.iPhone13, IosViewports.iPhone12]),
                  InspectorAddon(),
                  GridAddon(100),
                  ZoomAddon(),
                ],
              ),
            ),

            /// Editor + Preview
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  /// Editor de Código
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Box(
                            style: Style(
                              $box.borderRadius(10),

                              $box.height(80),
                              $box.width.infinity(),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Visualizar JSON",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton.outlined(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                            Colors.transparent,
                                          ),
                                      foregroundColor:
                                          WidgetStateProperty.all<Color>(
                                            AppColors.contentColorWhite,
                                          ),
                                    ),
                                    onPressed: _onParsePressed,
                                    icon: HeroIcon(
                                      HeroIcons.play,
                                      style: HeroIconStyle.solid,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                        ),
                      ],
                    ),
                  ),

                  /// Visualização do JSON
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DeviceFrame(
                        device: Devices.ios.iPhone13,
                        screen: Builder(
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
                                        child: Text("Cole os widgets JSON"),
                                      ),
                              );
                            } catch (e, stack) {
                              debugPrint("Erro na renderização: $e\n$stack");
                              return const Scaffold(
                                body: Center(
                                  child: Text(
                                    "Erro ao renderizar widget",
                                    style: TextStyle(color: Colors.red),
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
          ],
        ),
      ),
    );
  }
}
