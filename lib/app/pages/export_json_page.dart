import "dart:io";

import "package:json_app/app/json%20dynamic%20widget/curved_navigation_builder.dart";
import "package:json_app/app/json%20dynamic%20widget/page_index.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:path_provider/path_provider.dart";
import "package:share_plus/share_plus.dart";

class ExportJsonPage extends StatefulWidget {
  const ExportJsonPage({super.key});

  @override
  State createState() => _ExportJsonPageState();
}

class _ExportJsonPageState extends State<ExportJsonPage> {
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  int _count = 1;

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry();

    registry.setValue("index", _selectedIndex);

    registry.setValue("count", _count);
    registry.setValue(
      "increment",
      () =>
          () => setState(() => _count++),
    );

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: () async {
              final data = _exportKey.currentState!.export(
                indent: "  ",
                mode: ReverseEncodingMode.json,
              );

              final directory = await getApplicationDocumentsDirectory();
              final file = File("${directory.path}/exported_widget.json");
              await file.writeAsString(data);

              // Compartilhar o arquivo
              await Share.shareXFiles([
                XFile(file.path),
              ], text: "Widget exportado!");
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text("Exporter", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: JsonWidgetExporter(
          key: _exportKey,
          child: JsonExportable(child: exportedPage()),
        ),
      ),
    );
  }

  JsonScaffold exportedPage() {
    return JsonScaffold(
      body: JsonPageIndex(
        children: [
          JsonCenter(
            child: JsonContainer(
              decoration: null,
              foregroundDecoration: null,

              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
          JsonCenter(
            child: JsonContainer(
              decoration: null,
              foregroundDecoration: null,

              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ),
        ],
        index: 1,
      ),

      bottomNavigationBar: JsonCurvedNav(
        icons: [
          "https://appix.cs.simport.com.br/gallery/86/image-download",
          "https://appix.cs.simport.com.br/gallery/86/image-download",
        ],
      ),
    );
  }
}
