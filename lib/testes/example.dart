import 'dart:io';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:lucide_icons/lucide_icons.dart' show LucideIcons;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportExamplePage extends StatefulWidget {
  const ExportExamplePage({super.key});

  @override
  State createState() => _ExportExamplePageState();
}

class _ExportExamplePageState extends State<ExportExamplePage> {
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

              // ignore: deprecated_member_use
              await Share.shareXFiles([
                XFile(file.path),
              ], text: 'Widget exportado!');
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text('Exporter', style: TextStyle(color: Colors.white)),
      ),
      body: JsonWidgetExporter(
        key: _exportKey,
        child: JsonExportable(
          child: JsonScaffold(
            backgroundColor: Color(0xFFf0faff),
            body: JsonSingleChildScrollView(
              child: JsonPadding(
                padding: EdgeInsetsGeometry.all(20),
                child: JsonColumn(
                  children: [
                    JsonContainer(
                      foregroundDecoration: null,
                      height: 180,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFf0faff),
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
                      child: JsonColumn(
                        children: [
                          JsonRow(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              JsonIcon(
                                IconData(0xe174, fontFamily: 'MaterialIcons'),
                                size: 60,
                                color: Color(0xFF4387f6),
                              ),
                              JsonColumn(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  JsonText(
                                    "17°C",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  JsonText(
                                    "Sensação térmica: 18°C",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              JsonColumn(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  JsonText(
                                    "Paranaguá",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  JsonText(
                                    "Portos do Paraná",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          JsonSizedBox(height: 20),
                          secondLine(),
                        ],
                      ),
                    ),
                    JsonSizedBox(height: 20),
                    JsonRow(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JsonText(
                          "Previsões Detalhadas",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),

                    JsonSizedBox(height: 20),
                    cardL(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  JsonRow secondLine() {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(
          "3.0 nós",
          "SSW",
          const Color(0xFFecfeff),
          LucideIcons.wind,
          const Color(0xFF22bfd9),
        ),
        card(
          "79%",
          "Umidade",
          const Color(0xFFeff6ff),
          LucideIcons.droplets,
          const Color(0xFF4387f6),
        ),
        card(
          "1018",
          "Pressão",
          const Color(0xFFfffbeb),
          LucideIcons.thermometer,
          const Color(0xFFf6ab2b),
        ),
      ],
    );
  }

  JsonContainer card(
    String title,
    String subtitle,
    Color backgroundColor,
    IconData icon,
    Color iconColor,
  ) {
    return JsonContainer(
      foregroundDecoration: null,
      height: 60,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: JsonRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JsonIcon(icon, size: 20, weight: 20, color: iconColor),
          JsonSizedBox(width: 10),
          JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JsonText(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              JsonText(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  JsonContainer cardL() {
    return JsonContainer(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFf0faff),
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
