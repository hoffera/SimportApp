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
                            Colors.transparent,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            AppColors.contentColorWhite,
                          ),
                        ),
                        onPressed: _onParsePressed,
                        icon: HeroIcon(
                          HeroIcons.play,
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

              /// Conteúdo principal
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
        ),
      ],
    );
  }
}
