import "dart:convert";

import "package:http/http.dart" as http;
import "package:json_app/app/components/cards/commom_card.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CreateJsonPage extends StatefulWidget {
  const CreateJsonPage({super.key});

  @override
  State createState() => _CreateJsonPageState();
}

class _CreateJsonPageState extends State<CreateJsonPage> {
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry();

    registry.setValue("count", _count);
    registry.setValue(
      "increment",
      () =>
          () => setState(() => _count++),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: () async {
              final data = _exportKey.currentState!.export(
                indent: "  ",
                mode: ReverseEncodingMode.json,
              );
              await Clipboard.setData(ClipboardData(text: data));

              await enviarTextoParaAPI(data);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Copied to clipboard")),
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text("Exporter", style: TextStyle(color: Colors.white)),
      ),
      body: JsonWidgetExporter(
        key: _exportKey,
        child: JsonExportable(
          child: JsonScaffold(
            backgroundColor: Colors.white,
            body: JsonPadding(
              padding: const EdgeInsets.all(8.0),
              child: JsonCenter(
                child: JsonColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    JsonSizedBox(height: 100),

                    JsonCommomCard(
                      title: "Mare",
                      subtitle: "ha 10 minutos",
                      iconURL:
                          "https://appa.cs.simport.com.br/gallery/33/image-download",
                    ),
                    // JsonCircularGraph(angleDegrees: 130, title: "title"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> enviarTextoParaAPI(String texto) async {
    final url = Uri.parse(
      "http://10.0.2.2:5000/salvar",
    ); // Android emulador usa 10.0.2.2 para localhost

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"texto": texto}),
    );

    if (response.statusCode == 200) {
      print("Texto enviado com sucesso!");
    } else {
      print("Erro ao enviar: ${response.statusCode}");
    }
  }
}
