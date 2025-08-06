import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:json_app/app/components/cards/commom_card.dart";
import "package:json_app/app/components/sync/linear_chart/sync_linear_graph.dart";
import "package:json_app/app/components/text/title_widget.dart";
import "package:json_app/app/models/chart_1919_model.dart";
import "package:json_app/services/chart_1919_service.dart";
import "package:syncfusion_flutter_charts/charts.dart";

class AntoninaPage extends StatefulWidget {
  const AntoninaPage({super.key});

  @override
  State<AntoninaPage> createState() => _AntoninaPageState();
}

class _AntoninaPageState extends State<AntoninaPage> {
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
              SizedBox(height: 50),
              TitleWidget(title: "Vento"),
              SizedBox(height: 50),
              CommomCard(
                title: "Mare",
                subtitle: "ha 10 minutos",
                iconURL:
                    "https://appa.cs.simport.com.br/gallery/33/image-download",
              ),
              SizedBox(height: 50),

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
                        pointColorMapper: (ChartData data, _) => Colors.red,
                        color: Colors.red,
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

                    // interval: 1,
                    // maximum: 90,
                    title: AxisTitle(
                      text: "Vento (kn)",
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    axisLabelFormatter: (AxisLabelRenderDetails details) {
                      final intValue = double.parse(details.text).round();
                      return ChartAxisLabel(
                        "$intValue ${chartData.first.label}",
                        null,
                      );
                    },
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
                        height: 300,
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
                            plotBands: <PlotBand>[
                              PlotBand(
                                isVisible: true,
                                start: alignedStart,
                                isRepeatable: true,
                                repeatEvery: 2,
                                size: 1,

                                sizeType: DateTimeIntervalType.hours,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
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
