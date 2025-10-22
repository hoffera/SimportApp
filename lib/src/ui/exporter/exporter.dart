import "package:flutter_mobx/flutter_mobx.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:share_plus/share_plus.dart";

class ExporterScreen extends StatefulWidget {
  final JsonWidgetData child;
  const ExporterScreen({super.key, required this.child});

  @override
  State createState() => _ExporterScreenState();
}

class _ExporterScreenState extends State<ExporterScreen> {
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => Theme(
        data: getIt<ThemeStore>().isDarkMode
            ? getIt<ThemeStore>().simportThemeModel!.dark
            : getIt<ThemeStore>().simportThemeModel!.light,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.white),
                onPressed: () async {
                  final data = _exportKey.currentState!.export(
                    indent: "  ",
                    mode: ReverseEncodingMode.json,
                  );

                  final RenderBox box = context.findRenderObject() as RenderBox;

                  await SharePlus.instance.share(
                    ShareParams(
                      text: data,
                      subject: "Widget exportado",
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size,
                    ),
                  );
                },
              ),
            ],
            backgroundColor: Colors.black,
            title: const Text(
              "Exporter",
              style: TextStyle(color: Colors.white),
            ),
          ),

          body: JsonWidgetExporter(
            key: _exportKey,
            child: JsonExportable(child: widget.child),
          ),
        ),
      ),
    );
  }
}
