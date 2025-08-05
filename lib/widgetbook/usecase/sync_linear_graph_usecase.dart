import "package:flutter/material.dart";
import "package:json_app/app/components/sync/linear_chart/sync_linear_graph.dart";
import "package:json_app/widgetbook/addon/json_export_addon.dart";
import "package:json_app/widgetbook/knob/plotband_knob.dart";
import "package:json_app/widgetbook/widgets%20json/sync%20linear%20graph/default_graph.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import "package:widgetbook/widgetbook.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart";

@UseCase(name: "Gráfico: Linear (1 linha)", type: SyncLinearGraph)
Widget buildSyncLinearGraphUseCase(BuildContext context) {
  final seriesName = context.knobs.string(
    label: "Data Name",
    initialValue: "Velocidade Média",
  );

  final yAxisInterval = context.knobs.double.input(
    label: "yAxisInterval",
    initialValue: 10.0,
  );
  final yAxisMaximum = context.knobs.double.input(
    label: "yAxisMaximum",
    initialValue: 100.0,
  );
  final yAxisMinimum = context.knobs.double.input(
    label: "yAxisMinimum",
    initialValue: 0.0,
  );
  final yAxisTitle = AxisTitle(
    text: context.knobs.string(
      label: "yAxisTitle",
      initialValue: "Vento (Km/h)",
    ),
  );

  final showXAxis = context.knobs.boolean(
    label: "showXAxis",
    initialValue: true,
  );

  final xAxisInterval = context.knobs.double.input(
    label: "xAxisInterval",
    initialValue: 1.0,
  );
  final height = context.knobs.double.input(
    label: "Altura do gráfico",
    initialValue: 300,
  );
  return Scaffold(
    floatingActionButton: CopyCodeButton(
      code: getDefaultGraphJson(
        seriesName,
        yAxisInterval.toString(),
        yAxisMaximum.toString(),
        yAxisMinimum.toString(),
        yAxisTitle.text!,
        showXAxis.toString(),
        xAxisInterval.toString(),
        height.toString(),
      ),
    ),
    body: SyncLinearGraph(
      height: height,
      cartesianSeries: [
        SplineSeries<ChartData, DateTime>(
          name: seriesName,
          dataSource: [
            ChartData(
              y: 10,
              xDate: DateTime(2025, 12, 1),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 5,
              xDate: DateTime(2025, 12, 2),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 20,
              xDate: DateTime(2025, 12, 3),
              color: Colors.green,
              label: "kn",
            ),
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,

          legendIconType: LegendIconType.diamond,
          markerSettings: MarkerSettings(
            isVisible: context.knobs.boolean(
              label: "showMarkers",
              initialValue: false,
            ),
          ),

          yAxisName: seriesName,
          xAxisName: "xAxis",
        ),
      ],
      chartAxis: [
        NumericAxis(
          name: seriesName,
          interval: yAxisInterval,
          maximum: yAxisMaximum,
          minimum: yAxisMinimum,
          title: yAxisTitle,
        ),
      ],
      chartAxisX: DateTimeAxis(
        name: "xAxis",
        isVisible: showXAxis,
        interval: xAxisInterval,
      ),
    ),
  );
}

@UseCase(
  name: "Gráfico: Linear (2 Linhas), unidade diferentes",
  type: SyncLinearGraph,
)
Widget buildSyncLinearGraphMultiUseCase(BuildContext context) {
  final seriesName = context.knobs.string(
    label: "Data Name",
    initialValue: "Velocidade Média",
  );

  final yAxisInterval = context.knobs.double.input(
    label: "yAxisInterval",
    initialValue: 10.0,
  );
  final yAxisMaximum = context.knobs.double.input(
    label: "yAxisMaximum",
    initialValue: 100.0,
  );
  final yAxisMinimum = context.knobs.double.input(
    label: "yAxisMinimum",
    initialValue: 0.0,
  );
  final yAxisTitle = AxisTitle(
    text: context.knobs.string(
      label: "yAxisTitle",
      initialValue: "Vento (Km/h)",
    ),
  );

  final seriesName2 = context.knobs.string(
    label: "Data 2 Name",
    initialValue: "Temperatura Média",
  );

  final yAxisInterval2 = context.knobs.double.input(
    label: "yAxisInterval",
    initialValue: 5.0,
  );
  final yAxisMaximum2 = context.knobs.double.input(
    label: "yAxisMaximum",
    initialValue: 50.0,
  );
  final yAxisMinimum2 = context.knobs.double.input(
    label: "yAxisMinimum",
    initialValue: 1.0,
  );
  final yAxisTitle2 = AxisTitle(
    text: context.knobs.string(
      label: "yAxisTitle",
      initialValue: "Vento (Km/h)",
    ),
  );

  final showXAxis = context.knobs.boolean(
    label: "showXAxis",
    initialValue: true,
  );

  final xAxisInterval = context.knobs.double.input(
    label: "xAxisInterval",
    initialValue: 10.0,
  );
  final height = context.knobs.double.input(
    label: "Altura do gráfico",
    initialValue: 300,
  );
  return Scaffold(
    floatingActionButton: CopyCodeButton(
      code: getDefaultGraphJson(
        seriesName,
        yAxisInterval.toString(),
        yAxisMaximum.toString(),
        yAxisMinimum.toString(),
        yAxisTitle.text!,
        showXAxis.toString(),
        xAxisInterval.toString(),
        height.toString(),
      ),
    ),
    body: SyncLinearGraph(
      height: height,
      cartesianSeries: [
        SplineSeries<ChartData, DateTime>(
          name: seriesName,
          dataSource: [
            ChartData(
              y: 10,
              xDate: DateTime(2025, 12, 1),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 5,
              xDate: DateTime(2025, 12, 2),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 20,
              xDate: DateTime(2025, 12, 3),
              color: Colors.green,
              label: "kn",
            ),
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,

          legendIconType: LegendIconType.diamond,
          markerSettings: MarkerSettings(
            isVisible: context.knobs.boolean(
              label: "showMarkers",
              initialValue: false,
            ),
          ),

          yAxisName: seriesName,
          xAxisName: "xAxis",
        ),

        SplineSeries<ChartData, DateTime>(
          name: seriesName2,
          dataSource: [
            ChartData(
              y: 20,
              xDate: DateTime(2025, 12, 1),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 10,
              xDate: DateTime(2025, 12, 2),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 40,
              xDate: DateTime(2025, 12, 3),
              color: Colors.green,
              label: "kn",
            ),
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,

          legendIconType: LegendIconType.diamond,
          markerSettings: MarkerSettings(
            isVisible: context.knobs.boolean(
              label: "showMarkers",
              initialValue: false,
            ),
          ),

          yAxisName: seriesName2,
          xAxisName: "xAxis",
        ),
      ],

      chartAxis: [
        NumericAxis(
          name: seriesName,
          interval: yAxisInterval,
          maximum: yAxisMaximum,
          minimum: yAxisMinimum,
          title: yAxisTitle,
        ),
        NumericAxis(
          opposedPosition: true,
          name: seriesName2,
          interval: yAxisInterval2,
          maximum: yAxisMaximum2,
          minimum: yAxisMinimum2,
          title: yAxisTitle2,
        ),
      ],
      chartAxisX: DateTimeAxis(
        name: "xAxis",
        isVisible: showXAxis,

        // interval: xAxisInterval,
      ),
    ),
  );
}

@UseCase(name: "Plotbands", type: SyncLinearGraph)
Widget buildSyncLinearGraphWithPlotBandsUseCase(BuildContext context) {
  final start = context.knobs.double.input(label: "Início", initialValue: 0);
  final end = context.knobs.double.input(label: "Fim", initialValue: 10);
  final text = context.knobs.string(label: "Label", initialValue: "Nivel");
  final angle = context.knobs.int.input(
    label: "Ângulo do Texto",
    initialValue: 0,
  );
  final color = context.knobs.color(
    label: "Alinhamento horizontal do texto",
    initialValue: Colors.red,
  );
  final horizontalTextAlignment = context.knobs.horizontalTextAlignmentKnob();

  final fontSize = context.knobs.double.input(
    label: "Tamanho da fonte",
    initialValue: 12,
  );

  final textColor = context.knobs.color(
    label: "Cor do texto",
    initialValue: Colors.black,
  );
  return Scaffold(
    floatingActionButton: CopyCodeButton(
      code: getPlotband(
        start,
        end,
        angle,
        text,
        color,
        horizontalTextAlignment.index.toString(),
        fontSize,
        textColor,
      ),
    ),
    body: SyncLinearGraph(
      cartesianSeries: [
        SplineSeries<ChartData, DateTime>(
          enableTrackball: true,
          name: "Velocidade Média",
          dataSource: [
            ChartData(
              y: 10,
              xDate: DateTime(2025, 12, 1),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 5,
              xDate: DateTime(2025, 12, 2),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 20,
              xDate: DateTime(2025, 12, 3),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 45,
              xDate: DateTime(2025, 12, 4),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 65,
              xDate: DateTime(2025, 12, 5),
              color: Colors.green,
              label: "kn",
            ),
            ChartData(
              y: 85,
              xDate: DateTime(2025, 12, 6),
              color: Colors.green,
              label: "kn",
            ),
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => Colors.black,
          color: Colors.black,

          cardinalSplineTension: 0,
          legendIconType: LegendIconType.diamond,
          markerSettings: const MarkerSettings(isVisible: false),
          animationDuration: 3000,
          yAxisName: "vento",
          xAxisName: "xAxis",
        ),
      ],
      chartAxis: [
        NumericAxis(
          name: "vento",
          interval: 10,
          maximum: 100,
          minimum: 0,
          title: AxisTitle(
            text: "Vento (Km/h)",
            textStyle: const TextStyle(color: Colors.black),
          ),
          plotBands: [
            context.knobs.singlePlotBand(
              start: start,
              end: end,
              text: text,
              angle: angle,
              color: color,
              fontSize: fontSize,
              textColor: textColor,
              groupName: "PlotBand",
              horizontalTextAlignment: horizontalTextAlignment,
              context: context,
            ),
          ],
        ),
      ],
      chartAxisX: DateTimeAxis(name: "xAxis", isVisible: true, interval: 1),
    ),
  );
}
