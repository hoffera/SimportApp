// ignore_for_file: public_member_api_docs, sort_constructors_first
import "dart:io";
import "dart:ui" as ui;

import "package:json_app/components/cards/commom_card.dart";
import "package:json_app/components/synfusion/sync_linear_graph.dart";
import "package:json_app/components/synfusion/vertical_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";
import "package:path_provider/path_provider.dart";
import "package:share_plus/share_plus.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import "package:widgetbook/widgetbook.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart";

part "chart_widget.g.dart";

@jsonWidget
abstract class _ChartWidgetBuilder extends JsonWidgetBuilder {
  const _ChartWidgetBuilder({required super.args});

  @override
  ChartWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

@UseCase(name: "default", type: ChartWidget)
Widget buildChartWidgetUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: ChartWidget(
        chart: SyncLinearGraph(
          cartesianSeries: [
            SplineSeries<ChartData, DateTime>(
              enableTrackball: context.knobs.boolean(
                label: "enableTrackball",
                initialValue: true,
              ),
              name: context.knobs.string(
                label: "seriesName",
                initialValue: "Velocidade Média",
              ),
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
        title: context.knobs.string(label: "title", initialValue: "Maré"),
        subtitle: context.knobs.string(
          label: "subtitle",
          initialValue: "20/03/2025",
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

class ChartWidget extends StatefulWidget {
  final Widget chart;
  final String title;
  final String subtitle;
  const ChartWidget({
    super.key,
    required this.chart,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final GlobalKey _chartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 500,
      child: Box(
        style: Style(
          $box.elevation(2),
          $box.borderRadius(20),
          $box.color(Theme.of(context).colorScheme.onPrimary),
          $box.padding.all(20),
          $box.alignment.center(),
        ),
        child: Column(
          children: [
            _title(),
            RepaintBoundary(key: _chartKey, child: widget.chart),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommomCard(
            title: widget.title,
            subtitle: widget.subtitle,
            iconURL: "https://tcp.cs.simport.com.br/gallery/29/image-download",
          ),
          _buttons(context),
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      children: [
        _expandedChartButton(),
        const SizedBox(width: 8),
        _exportChartButton(context),
        const SizedBox(width: 8),
        _shareChartButton(),
      ],
    );
  }

  Widget _expandedChartButton() {
    return _circleButton(
      icon: Icons.open_in_full_rounded,
      onPressed: () {
        VerticalWidget.show(context, child: widget.chart);
      },
    );
  }

  Widget _exportChartButton(BuildContext context) {
    return _circleButton(
      icon: Icons.download,
      onPressed: () => exportChartAsImage(context),
    );
  }

  Widget _shareChartButton() {
    return _circleButton(
      icon: Icons.share,
      onPressed: () {
        final box = context.findRenderObject() as RenderBox?;
        shareChartAsImage(box);
      },
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Box(
      style: Style(
        $box.elevation(2),
        $box.shape.circle(side: BorderSide(width: 0.5)),
        $box.height(40),
        $box.width(40),
        $box.color(Theme.of(context).colorScheme.onPrimary),
        $box.alignment.center(),
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        iconSize: 20,
        padding: EdgeInsets.zero,
        splashRadius: 20,
      ),
    );
  }

  Future<void> exportChartAsImage(BuildContext context) async {
    try {
      final file = await _captureChartAndSave();

      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gráfico salvo em: ${file.path}")));
    } catch (e, stackTrace) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erro ao exportar gráfico: $e")));
      }
      debugPrint("Erro ao exportar gráfico: $e\n$stackTrace");
    }
  }

  Future<void> shareChartAsImage(RenderBox? box) async {
    try {
      final file = await _captureChartAndSave();

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: "Confira o gráfico exportado!",
          sharePositionOrigin: box != null
              ? box.localToGlobal(Offset.zero) & box.size
              : null,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint("Erro ao compartilhar gráfico: $e\n$stackTrace");
    }
  }

  Future<File> _captureChartAndSave() async {
    final boundary =
        _chartKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final file = File("${directory.path}/grafico_compartilhado.png");
    await file.writeAsBytes(pngBytes);
    return file;
  }
}
