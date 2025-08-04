import "package:flutter/material.dart";
import "package:json_app/widgetbook/widgetbook.directories.g.dart";
import "package:widgetbook/widgetbook.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart" as widgetbook;

void main() {
  runApp(WidgetBookApp());
}

@widgetbook.App(
  cloudAddonsConfigs: {
    "iPhone 13": [ViewportAddonConfig(IosViewports.iPhone13)],
    "iPhone 12": [ViewportAddonConfig(IosViewports.iPhone12)],
  },
)
class WidgetBookApp extends StatelessWidget {
  const WidgetBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,

      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: "Light", data: ThemeData()),
            WidgetbookTheme(name: "Dark", data: ThemeData.dark()),
          ],
        ),

        ViewportAddon([IosViewports.iPhone13, IosViewports.iPhone12]),
        InspectorAddon(),
        GridAddon(100),

        ZoomAddon(),
      ],
    );
  }
}
