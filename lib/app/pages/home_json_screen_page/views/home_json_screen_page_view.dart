import 'dart:async';

import 'package:json_app/app/models/chart_1885_model.dart';
import 'package:json_app/services/chart_service.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonScreenPage extends StatefulWidget {
  const JsonScreenPage({super.key});

  @override
  State<JsonScreenPage> createState() => _JsonScreenPageState();
}

class _JsonScreenPageState extends State<JsonScreenPage> {
  late Future<List<Chart1885>> _futureDados;
  final registry = JsonWidgetRegistry.instance;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _buscarDados();

    // Atualiza a cada 30 segundos, por exemplo:
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      _buscarDados();
    });
  }

  void _buscarDados() {
    setState(() {
      _futureDados = ChartService.fetchDados();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Map<String, dynamic> montarJsonLayout(Chart1885 chart) {
    return {
      "type": "scaffold",
      "args": {
        "backgroundColor": "#ffffffff",
        "body": {
          "type": "padding",
          "args": {
            "padding": {"bottom": 8.0, "left": 8.0, "right": 8.0, "top": 8.0},
            "child": {
              "type": "center",
              "args": {
                "child": {
                  "type": "column",
                  "args": {
                    "children": [
                      {
                        "type": "sized_box",
                        "args": {"height": 100.0},
                      },
                      {
                        "type": "commom_card",
                        "args": {
                          "iconURL":
                              "https://appa.cs.simport.com.br/gallery/33/image-download",
                          "subtitle": "há 10 minutos",
                          "title": "Maré",
                        },
                      },
                      {
                        "type": "circular_graph",
                        "args": {
                          "angleDegrees": chart.windDirectionAverage!
                              .toDouble(),
                          "title": chart.windDirectionAverageDescAbv ?? "title",
                        },
                      },
                    ],
                  },
                },
              },
            },
          },
        },
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chart1885>>(
      future: _futureDados,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final lastChart = snapshot.data!.last;
        final jsonLayout = montarJsonLayout(lastChart);
        final widgetData = JsonWidgetData.fromDynamic(
          jsonLayout,
          registry: registry,
        );

        return widgetData.build(context: context);
      },
    );
  }
}
