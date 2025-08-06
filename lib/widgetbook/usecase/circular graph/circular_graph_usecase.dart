import "package:flutter/material.dart";
import "package:json_app/app/components/simport/circular_graph/circular_graph.dart";
import "package:json_app/app/components/sync/circular_chart/circular_chart.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/widgetbook/addon/json_export_addon.dart";
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

@UseCase(name: "Gráfico default", type: CircularChart)
Widget buildCircularChartUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.primary,
    floatingActionButton: CopyCodeButton(code: ""),
    body: Container(height: 300, color: Colors.red, child: CircularChart()),
  );
}
