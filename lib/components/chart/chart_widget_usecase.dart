import "package:flutter/material.dart";
import "package:json_app/components/chart/chart_widget.dart";
import "package:json_app/components/synfusion/sync_linear_graph.dart";
import "package:json_app/widgetbook/json_export_addon.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import "package:widgetbook/widgetbook.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart";

@UseCase(name: "default", type: ChartWidget)
Widget buildChartWidgetUseCase(BuildContext context) {
  final seriesName = context.knobs.string(
    label: "seriesName",
    initialValue: "Velocidade Média",
  );
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: WidgetWithCopyButton(
          code: "text: $seriesName",
          child: ChartWidget(
            chart: SyncLinearGraph(
              cartesianSeries: [
                SplineSeries<ChartData, DateTime>(
                  enableTrackball: context.knobs.boolean(
                    label: "enableTrackball",
                    initialValue: true,
                  ),
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
                  pointColorMapper: (ChartData data, _) => Colors.black,
                  color: context.knobs.color(
                    label: "seriesColor",
                    initialValue: Colors.black,
                  ),
                  splineType: context.knobs.list(
                    label: "splineType",
                    initialOption: SplineType.natural,
                    options: [
                      SplineType.cardinal,
                      SplineType.clamped,
                      SplineType.monotonic,
                      SplineType.natural,
                    ],
                    labelBuilder: (value) => value.name,
                  ),
                  cardinalSplineTension: context.knobs.double.slider(
                    label: "cardinalSplineTension",
                    initialValue: 0.0,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                  ),
                  legendIconType: context.knobs.list(
                    label: "legendIconType",
                    initialOption: LegendIconType.diamond,
                    options: [
                      LegendIconType.circle,
                      LegendIconType.diamond,
                      LegendIconType.rectangle,
                      LegendIconType.triangle,
                      LegendIconType.pentagon,
                    ],
                    labelBuilder: (value) => value.name,
                  ),
                  markerSettings: MarkerSettings(
                    isVisible: context.knobs.boolean(
                      label: "showMarkers",
                      initialValue: false,
                    ),
                  ),
                  animationDuration: context.knobs.double.input(
                    label: "animationDuration",
                    initialValue: 3000.0,
                  ),
                  yAxisName: "vento",
                  xAxisName: "xAxis",
                ),
              ],
              chartAxis: [
                NumericAxis(
                  name: "vento",
                  interval: context.knobs.double.input(
                    label: "yAxisInterval",
                    initialValue: 10.0,
                  ),
                  maximum: context.knobs.double.input(
                    label: "yAxisMaximum",
                    initialValue: 100.0,
                  ),
                  minimum: context.knobs.double.input(
                    label: "yAxisMinimum",
                    initialValue: 0.0,
                  ),
                  title: AxisTitle(
                    text: context.knobs.string(
                      label: "yAxisTitle",
                      initialValue: "Vento (Km/h)",
                    ),
                    textStyle: TextStyle(
                      color: context.knobs.color(
                        label: "yAxisTitleColor",
                        initialValue: Colors.black,
                      ),
                    ),
                  ),
                  majorGridLines: MajorGridLines(
                    color: context.knobs.color(
                      label: "gridLineColor",
                      initialValue: Colors.grey,
                    ),
                    width: context.knobs.double.slider(
                      label: "gridLineWidth",
                      initialValue: 1.0,
                      min: 0.0,
                      max: 5.0,
                      divisions: 10,
                    ),
                  ),
                ),
              ],
              chartAxisX: DateTimeAxis(
                name: "xAxis",
                isVisible: context.knobs.boolean(
                  label: "showXAxis",
                  initialValue: true,
                ),
                interval: context.knobs.double.input(
                  label: "xAxisInterval",
                  initialValue: 1.0,
                ),
              ),
            ),
            title: context.knobs.string(label: "title", initialValue: "Marés"),
            subtitle: context.knobs.string(
              label: "subtitle",
              initialValue: "20/03/2025",
            ),
          ),
        ),
      ),
    ),
  );
}

@UseCase(name: "with_plot_bands", type: ChartWidget)
Widget buildChartWidgetWithPlotBandsUseCase(BuildContext context) {
  return ChartWidget(
    chart: SyncLinearGraph(
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
          splineType: context.knobs.list(
            label: "splineType",
            initialOption: SplineType.natural,
            options: [
              SplineType.cardinal,
              SplineType.clamped,
              SplineType.monotonic,
              SplineType.natural,
            ],
            labelBuilder: (value) => value.name,
          ),
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
          plotBands: <PlotBand>[
            PlotBand(
              isVisible: context.knobs.boolean(
                label: "showLevel0",
                initialValue: true,
              ),
              start: 0,
              end: 40,
              color: const Color(0xFFa0f3d5),
              text: context.knobs.string(
                label: "level0Text",
                initialValue: "Nível 0",
              ),
              textAngle: context.knobs.int.slider(
                label: "textAngle",
                initialValue: 270,
                min: 0,
                max: 360,
                divisions: 36,
              ),
              horizontalTextAlignment: TextAnchor.start,
            ),
            PlotBand(
              isVisible: context.knobs.boolean(
                label: "showLevel1",
                initialValue: true,
              ),
              start: 40,
              end: 60,
              color: const Color(0xFFeffaa8),
              text: context.knobs.string(
                label: "level1Text",
                initialValue: "Nível 1",
              ),
              textAngle: 270,
              horizontalTextAlignment: TextAnchor.start,
            ),
            PlotBand(
              isVisible: context.knobs.boolean(
                label: "showLevel2",
                initialValue: true,
              ),
              start: 60,
              end: 70,
              color: const Color(0xFFf5e131),
              text: context.knobs.string(
                label: "level2Text",
                initialValue: "Nível 2",
              ),
              textAngle: 270,
              horizontalTextAlignment: TextAnchor.start,
            ),
            PlotBand(
              isVisible: context.knobs.boolean(
                label: "showLevel3",
                initialValue: true,
              ),
              start: 70,
              end: 80,
              color: const Color(0xfff5af58),
              text: context.knobs.string(
                label: "level3Text",
                initialValue: "Nível 3",
              ),
              textAngle: 270,
              horizontalTextAlignment: TextAnchor.start,
            ),
            PlotBand(
              isVisible: context.knobs.boolean(
                label: "showLevel4",
                initialValue: true,
              ),
              start: 80,
              end: 100,
              color: const Color(0xFFff4c1f),
              text: context.knobs.string(
                label: "level4Text",
                initialValue: "Nível 4",
              ),
              textAngle: 270,
              horizontalTextAlignment: TextAnchor.start,
            ),
          ],
          majorGridLines: const MajorGridLines(color: Colors.grey, width: 1),
        ),
      ],
      chartAxisX: DateTimeAxis(name: "xAxis", isVisible: true, interval: 1),
    ),
    title: context.knobs.string(label: "title", initialValue: "Maré"),
    subtitle: context.knobs.string(
      label: "subtitle",
      initialValue: "20/03/2025",
    ),
  );
}

@UseCase(name: "multiple_series", type: ChartWidget)
Widget buildChartWidgetMultipleSeriesUseCase(BuildContext context) {
  return ChartWidget(
    chart: SyncLinearGraph(
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
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => Colors.green,
          color: Colors.green,
          splineType: SplineType.natural,
          cardinalSplineTension: 0,
          legendIconType: LegendIconType.diamond,
          markerSettings: const MarkerSettings(isVisible: false),
          animationDuration: 3000,
          yAxisName: "vento",
          xAxisName: "xAxis",
        ),
        SplineSeries<ChartData, DateTime>(
          enableTrackball: true,
          name: "Temperatura",
          dataSource: [
            ChartData(
              y: 25,
              xDate: DateTime(2025, 12, 1),
              color: Colors.red,
              label: "°C",
            ),
            ChartData(
              y: 28,
              xDate: DateTime(2025, 12, 2),
              color: Colors.red,
              label: "°C",
            ),
            ChartData(
              y: 22,
              xDate: DateTime(2025, 12, 3),
              color: Colors.red,
              label: "°C",
            ),
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => Colors.red,
          color: Colors.red,
          splineType: context.knobs.list(
            label: "secondSeriesSplineType",
            initialOption: SplineType.natural,
            options: [
              SplineType.cardinal,
              SplineType.clamped,
              SplineType.monotonic,
              SplineType.natural,
            ],
            labelBuilder: (value) => value.name,
          ),
          cardinalSplineTension: 0,
          legendIconType: LegendIconType.circle,
          markerSettings: MarkerSettings(
            isVisible: context.knobs.boolean(
              label: "showSecondSeriesMarkers",
              initialValue: true,
            ),
          ),
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
            text: context.knobs.string(
              label: "yAxisTitle",
              initialValue: "Valores",
            ),
            textStyle: const TextStyle(color: Colors.black),
          ),
          majorGridLines: const MajorGridLines(color: Colors.grey, width: 1),
        ),
      ],
      chartAxisX: DateTimeAxis(
        name: "xAxis",
        isVisible: true,
        interval: context.knobs.double.input(
          label: "xAxisInterval",
          initialValue: 1,
        ),
      ),
    ),
    title: context.knobs.string(
      label: "title",
      initialValue: "Dados Meteorológicos",
    ),
    subtitle: context.knobs.string(
      label: "subtitle",
      initialValue: "20/03/2025",
    ),
  );
}

@UseCase(name: "minimal_data", type: ChartWidget)
Widget buildChartWidgetMinimalDataUseCase(BuildContext context) {
  return ChartWidget(
    chart: SyncLinearGraph(
      cartesianSeries: [
        SplineSeries<ChartData, DateTime>(
          enableTrackball: context.knobs.boolean(
            label: "enableTrackball",
            initialValue: false,
          ),
          name: "Dados Simples",
          dataSource: [
            ChartData(
              y: 5,
              xDate: DateTime(2025, 12, 1),
              color: Colors.blue,
              label: "valor",
            ),
            ChartData(
              y: 8,
              xDate: DateTime(2025, 12, 2),
              color: Colors.blue,
              label: "valor",
            ),
          ],
          xValueMapper: (ChartData data, _) => data.xDate,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => Colors.blue,
          color: Colors.blue,
          splineType: SplineType.natural,
          cardinalSplineTension: 0,
          legendIconType: LegendIconType.rectangle,
          markerSettings: const MarkerSettings(isVisible: true),
          animationDuration: context.knobs.double.input(
            label: "animationDuration",
            initialValue: 1000.0,
          ),
          yAxisName: "yAxis",
          xAxisName: "xAxis",
        ),
      ],
      chartAxis: [
        NumericAxis(
          name: "yAxis",
          interval: 5,
          maximum: 10,
          minimum: 0,
          title: AxisTitle(
            text: context.knobs.string(
              label: "yAxisTitle",
              initialValue: "Valores",
            ),
            textStyle: const TextStyle(color: Colors.black),
          ),
          majorGridLines: const MajorGridLines(color: Colors.grey, width: 1),
        ),
      ],
      chartAxisX: DateTimeAxis(
        name: "xAxis",
        isVisible: context.knobs.boolean(
          label: "showXAxis",
          initialValue: true,
        ),
        interval: 1,
      ),
    ),
    title: context.knobs.string(
      label: "title",
      initialValue: "Gráfico Simples",
    ),
    subtitle: context.knobs.string(
      label: "subtitle",
      initialValue: "Dados Básicos",
    ),
  );
}
