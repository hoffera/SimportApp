import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:json_app/app/components/sync/linear_chart/sync_linear_graph.dart";
import "package:json_app/app/models/chart_1919_model.dart";
import "package:json_app/services/chart_1919_service.dart";
import "package:syncfusion_flutter_charts/charts.dart";

class PageGraphPlots extends StatefulWidget {
  const PageGraphPlots({super.key});

  @override
  State<PageGraphPlots> createState() => _PageGraphPlotsState();
}

class _PageGraphPlotsState extends State<PageGraphPlots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<Chart1919>>(
                future: Chart1919Service.fetchDados(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Erro: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("Nenhum dado encontrado."));
                  }
                  final data = snapshot.data!;
                  final List<ChartData> chartData = data
                      .map((e) {
                        final sec = e.date?.sec;
                        if (sec == null) return null;

                        final dateTime = DateTime.fromMillisecondsSinceEpoch(
                          sec * 1000,
                        ).toLocal();
                        final formattedTime = DateFormat.Hm().format(dateTime);
                        final windSpeed = e.windSpeed?.toDouble() ?? 0;

                        return ChartData(
                          y: windSpeed,
                          x: formattedTime,
                          xDate: dateTime,
                          label: "kn",
                        );
                      })
                      .whereType<ChartData>()
                      .toList();

                  SplineSeries<ChartData, DateTime> line =
                      SplineSeries<ChartData, DateTime>(
                        enableTrackball: true,
                        name: "Velocidade Média",
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.xDate,
                        yValueMapper: (ChartData data, _) => data.y,
                        pointColorMapper: (ChartData data, _) => Colors.black,
                        color: Colors.black,
                        splineType: SplineType.cardinal,
                        cardinalSplineTension: 0,
                        legendIconType: LegendIconType.diamond,
                        markerSettings: const MarkerSettings(isVisible: false),
                        animationDuration: 3000,
                        yAxisName: "vento",
                        xAxisName: "xAxis",
                      );
                  SplineSeries<ChartData, DateTime> line5 =
                      SplineSeries<ChartData, DateTime>(
                        enableTrackball: true,
                        name: "Velocidade Máxima",
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.xDate,
                        yValueMapper: (ChartData data, _) => data.y * 2,
                        pointColorMapper: (ChartData data, _) => Colors.blue,
                        color: Colors.blue,
                        splineType: SplineType.cardinal,
                        cardinalSplineTension: 0,
                        legendIconType: LegendIconType.diamond,
                        markerSettings: const MarkerSettings(isVisible: false),
                        animationDuration: 3000,
                        yAxisName: "vento",
                        xAxisName: "xAxis",
                      );

                  NumericAxis numericAxis2 = NumericAxis(
                    name: "vento",
                    interval: 10,
                    maximum: 100,
                    minimum: 0,
                    title: AxisTitle(
                      text: "Vento (Km/h)",
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    plotBands: <PlotBand>[
                      PlotBand(
                        isVisible: true,
                        start: 0,
                        end: 40,
                        color: Color(0xFFa0f3d5),
                        text: "Nível 0",
                        textAngle: 270,
                        horizontalTextAlignment: TextAnchor.start,
                      ),
                      PlotBand(
                        isVisible: true,
                        start: 40,
                        end: 60,
                        color: Color(0xFFeffaa8),
                        text: "Nível 1",
                        textAngle: 270,
                        horizontalTextAlignment: TextAnchor.start,
                      ),
                      PlotBand(
                        isVisible: true,
                        start: 60,
                        end: 70,
                        color: Color(0xFFf5e131),
                        text: "Nível 2",
                        textAngle: 270,
                        horizontalTextAlignment: TextAnchor.start,
                      ),
                      PlotBand(
                        isVisible: true,
                        start: 70,
                        end: 80,
                        color: Color(0xfff5af58),
                        text: "Nível 3",
                        textAngle: 270,
                        horizontalTextAlignment: TextAnchor.start,
                      ),
                      PlotBand(
                        isVisible: true,
                        start: 80,
                        end: 100,
                        color: Color(0xFFff4c1f),
                        text: "Nível 4",
                        textAngle: 270,
                        horizontalTextAlignment: TextAnchor.start,
                      ),
                    ],

                    majorGridLines: const MajorGridLines(
                      color: Colors.grey,
                      width: 1,
                    ),
                  );
                  DateTime alignedStart = DateTime(
                    chartData.first.xDate!.year,
                    chartData.first.xDate!.month,
                    chartData.first.xDate!.day,
                    chartData.first.xDate!.hour +
                        1, // arredonda para a próxima hora
                  );

                  return Column(
                    children: [
                      SizedBox(
                        height: 600,
                        width: 500,
                        child: SyncLinearGraph(
                          cartesianSeries: [line, line5],
                          chartAxis: [numericAxis2],

                          chartAxisX: DateTimeAxis(
                            name: "xAxis",
                            isVisible: true,
                            interval: 1,
                            intervalType: DateTimeIntervalType.hours,
                            dateFormat: DateFormat.Hm(),
                            initialVisibleMinimum: chartData.first.xDate,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
