import "dart:convert";

import "package:flutter_mobx/flutter_mobx.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/store/dynamic_screen_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/ui/widgets/error_screen/error_screen.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class DynamicScreen extends StatefulWidget {
  final int pageID;
  final String? skeleton;
  const DynamicScreen({super.key, required this.pageID, this.skeleton});

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  final DynamicScreenStore _dynamicScreenStore = getIt<DynamicScreenStore>();
  final ThemeStore themeStore = getIt<ThemeStore>();
  @override
  void initState() {
    super.initState();

    loadDynamicScreen();
  }

  Future<void> loadDynamicScreen() async {
    await _dynamicScreenStore.loadDynamicScreen(widget.pageID);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Theme(
          data: themeStore.simportThemeModel == null
              ? (themeStore.isDarkMode
                    ? themeStore.simportThemeModel!.dark
                    : themeStore.simportThemeModel!.light)
              : (themeStore.isDarkMode
                    ? themeStore.clientThemeModel!.dark
                    : themeStore.clientThemeModel!.light),
          child: _buildScreen(context),
        );
      },
    );
  }

  Widget _buildScreen(BuildContext context) => Observer(
    builder: (context) {
      final state = _dynamicScreenStore.state;
      switch (state) {
        case DynamicScreenState.loading:
          if (widget.skeleton == null || widget.skeleton?.isEmpty == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _JsonWidget(widgetString: widget.skeleton!);
          }
        case DynamicScreenState.success:
          if (_dynamicScreenStore.view?.scaffold == null ||
              _dynamicScreenStore.view!.scaffold?.isEmpty == true) {
            return const ErrorScreen(message: "Scaffold não encontrado");
          } else {
            return _JsonWidget(
              widgetString: _dynamicScreenStore.view!.scaffold!,
            );
          }
        case DynamicScreenState.error:
          return const ErrorScreen();
      }
    },
  );
}

class _JsonWidget extends StatelessWidget {
  final String widgetString;

  @override
  const _JsonWidget({required this.widgetString});

  @override
  Widget build(BuildContext context) {
    try {
      final widget = parseWidget(widgetString);
      if (widget == null) {
        return const ErrorScreen(message: "Widget não encontrado");
      }
      return widget.build(context: context);
    } catch (e) {
      return ErrorScreen(message: "Erro: ${e.toString()}");
    }
  }
}

JsonWidgetData? parseWidget(String text) {
  try {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) {
      print("Erro: Widget vazio");
      return null;
    }

    if (!trimmedText.startsWith("{") && !trimmedText.startsWith("[")) {
      print("Erro: Widget não é um JSON válido");
      return null;
    }

    Map<String, dynamic> jsonData;

    try {
      final decoded = jsonDecode(trimmedText);
      if (decoded is Map<String, dynamic>) {
        jsonData = decoded;
      } else if (decoded is List && decoded.isNotEmpty) {
        final firstItem = decoded.first;
        if (firstItem is Map<String, dynamic>) {
          jsonData = firstItem;
        } else {
          print("Erro: Primeiro item não é um Map");
          return null;
        }
      } else {
        print("Erro: JSON não é um Map ou List");
        return null;
      }
    } catch (e) {
      print("Erro ao decodificar JSON: $e");
      return null;
    }

    Map<String, dynamic> widgetData;
    if (jsonData.containsKey("json")) {
      final jsonContent = jsonData["json"];
      if (jsonContent is Map<String, dynamic>) {
        widgetData = jsonContent;
      } else {
        print("Erro: Campo 'json' não é um Map");
        return null;
      }
    } else {
      widgetData = jsonData;
    }

    if (widgetData.isEmpty) {
      print("Erro: widgetData está vazio após extração");
      return null;
    }

    try {
      final widget = JsonWidgetData.fromDynamic(widgetData, registry: registry);

      try {
        final testJson = widget.toJson();
        if (testJson.isEmpty) {
          print("Erro: Widget convertido para JSON está vazio");
          return null;
        }
      } catch (e) {
        print("Erro ao serializar widget para JSON: $e");
        return null;
      }

      return widget;
    } catch (e) {
      print("Erro ao criar JsonWidgetData: $e");
      return null;
    }
  } catch (e) {
    print("Erro desconhecido no parseWidget: $e");
    return null;
  }
}
