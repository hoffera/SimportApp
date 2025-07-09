import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'dart:io';

import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:lucide_icons/lucide_icons.dart' show LucideIcons;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportcardLPage extends StatefulWidget {
  const ExportcardLPage({super.key});

  @override
  State createState() => _ExportcardLPageState();
}

class _ExportcardLPageState extends State<ExportcardLPage> {
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry();

    registry.setValue('count', _count);
    registry.setValue(
      'increment',
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
                indent: '  ',
                mode: ReverseEncodingMode.json,
              );

              final directory = await getApplicationDocumentsDirectory();
              final file = File('${directory.path}/exported_widget.json');
              await file.writeAsString(data);

              // Compartilhar o arquivo
              await Share.shareXFiles([
                XFile(file.path),
              ], text: 'Widget exportado!');
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text('Exporter', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: JsonWidgetExporter(
          key: _exportKey,
          child: JsonExportable(child: cardL()),
        ),
      ),
    );
  }

  JsonContainer cardL() {
    return JsonContainer(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Color(0xFFdbeafe), width: 2),
      ),
      foregroundDecoration: null,
      child: JsonColumn(
        children: [
          rain(),
          JsonSizedBox(height: 10),
          titles(),
          JsonSizedBox(height: 10),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1),
          line(),
          linearInfos("11:00", 0xf04cf, "0.4 mm", 0.91),
          line(),
          linearInfos("13:00", 0xf04cf, "0.2 mm", 0.28),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 0.5),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1),
        ],
      ),
    );
  }

  JsonRow rain() {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JsonText(
          "Previsão de Chuvas",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        JsonIcon(
          IconData(0xf04cf, fontFamily: 'MaterialIcons'),
          size: 23,
          color: Color(0xFF4387f6),
        ),
      ],
    );
  }

  JsonRow titles() {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Hora",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Condição",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Precipit.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Probabil.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  JsonSizedBox linearInfos(
    String hora,
    int iconHex,
    String precipit,
    double porcentagem,
  ) {
    return JsonSizedBox(
      height: 40,
      child: JsonRow(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JsonText(
                  hora,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JsonIcon(
                  IconData(iconHex, fontFamily: 'MaterialIcons'),
                  size: 23,
                  color: Color(0xFF4387f6),
                ),
              ],
            ),
          ),
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [JsonText(precipit, style: TextStyle(fontSize: 18))],
            ),
          ),
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [porcentagemWidget(porcentagem)],
            ),
          ),
        ],
      ),
    );
  }

  JsonSizedBox porcentagemWidget(double porcentagem) {
    const larguraTotal = 30.0;
    final larguraCalculada = larguraTotal * porcentagem;
    final larguraAtual = larguraCalculada < 10.0 ? 10.0 : larguraCalculada;

    return JsonSizedBox(
      child: JsonRow(
        children: [
          JsonStack(
            children: [
              JsonContainer(
                width: larguraTotal,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                foregroundDecoration: null,
              ),
              JsonContainer(
                width: larguraAtual,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(20),
                    right: Radius.circular(porcentagem >= 0.9 ? 20 : 0),
                  ),
                ),
                foregroundDecoration: null,
              ),
            ],
          ),
          JsonSizedBox(width: 8),
          JsonText('${(porcentagem * 100).toStringAsFixed(0)}%'),
        ],
      ),
    );
  }

  JsonContainer line() {
    return JsonContainer(
      foregroundDecoration: null,
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        color: Colors.grey[300], // linha cinza clara
      ),
    );
  }
}
