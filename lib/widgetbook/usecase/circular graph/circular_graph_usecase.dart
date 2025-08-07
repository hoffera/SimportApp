import "package:flutter/material.dart";
import "package:json_app/app/components/simport/circular_graph/circular_graph.dart";
import "package:json_app/app/components/sync/circular_chart/circular_chart.dart";
import "package:json_app/widgetbook/addon/json_export_addon.dart";
import "package:json_app/widgetbook/widgets%20json/circular_chart/circular_chart_json.dart";
import "package:widgetbook/widgetbook.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart";

@UseCase(name: "Gráfico default", type: CircularGraph)
Widget buildCircularGraphUseCase(BuildContext context) {
  return Scaffold(
    floatingActionButton: CopyCodeButton(code: ""),
    body: Center(
      child: SizedBox(
        child: CircularGraph(
          angleDegrees: 10,
          title: "De\nSe",
          arrowOutward: true,
          pointerColor: Colors.red,
        ),
      ),
    ),
  );
}

@UseCase(name: "Gráfico padrao", type: CircularChart)
Widget buildCircularChartUseCase(BuildContext context) {
  final title = context.knobs.string(label: "Título", initialValue: "Se");
  final subtitle = context.knobs.stringOrNull(
    label: "Subtítulo",
    initialValue: null,
  );
  final angleDegrees = context.knobs.double.input(
    label: "Ângulo",
    initialValue: 10,
  );
  final arrowOutward = context.knobs.boolean(
    label: "Seta para fora",
    initialValue: true,
  );

  return Scaffold(
    floatingActionButton: CopyCodeButton(
      code: getDefaultCircularChartJson(
        title: title,
        subtitle: subtitle,
        angleDegrees: angleDegrees,
        arrowOutward: arrowOutward,
      ),
    ),
    body: Center(
      child: CircularChart(
        angleDegrees: 10,
        title: "Se",
        subtitle: "De",
        arrowOutward: true,
      ),
    ),
  );
}
