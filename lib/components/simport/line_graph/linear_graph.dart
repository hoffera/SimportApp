import 'package:flutter/material.dart';
import 'package:highcharts_flutter/highcharts.dart';
import 'package:json_app/app/models/chart_1919_model.dart';

class LinearGraphFL extends StatefulWidget {
  final int tickCount;
  final bool verticalAxisRight;
  final List<Chart1919> data;

  const LinearGraphFL({
    super.key,
    required this.tickCount,
    this.verticalAxisRight = false,
    required this.data,
  });

  @override
  State<LinearGraphFL> createState() => _LinearGraphFLState();
}

class _LinearGraphFLState extends State<LinearGraphFL> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final data = <List<num>>[];

    for (int i = 0; i < widget.data.length; i++) {
      final e = widget.data[i];
      final sec = e.date?.sec;

      if (sec != null) {
        // Tempo em horas decimais a partir da meia-noite
        final dateTime = DateTime.fromMillisecondsSinceEpoch(
          sec * 1000,
        ).toLocal();
        final hoursDecimal = dateTime.hour + dateTime.minute / 60;

        final windSpeed = e.windSpeed?.toDouble() ?? 0;
        data.add([hoursDecimal, windSpeed]);
      }
    }
    final data2 = <List<num>>[];

    for (int i = 0; i < widget.data.length; i++) {
      final e = widget.data[i];
      final sec = e.date?.sec;

      if (sec != null) {
        // Tempo em horas decimais a partir da meia-noite
        final dateTime = DateTime.fromMillisecondsSinceEpoch(
          sec * 1000,
        ).toLocal();
        final hoursDecimal = dateTime.hour + dateTime.minute / 60;

        final windSpeed = e.windSpeed?.toDouble() ?? 0;
        data2.add([hoursDecimal, windSpeed * 3]);
      }
    }

    return HighchartsChart(
      HighchartsOptions(
        credits: HighchartsCreditsOptions(enabled: false),
        series: [
          HighchartsLineSeries(
            name: 'Velocidade Vento',
            data: data, // certifique-se que seja diferente de data2
            options: HighchartsLineSeriesOptions(color: '#0000FF'),
          ),
          HighchartsLineSeries(
            name: 'Vento teste',
            data: data2, // valores diferentes
            options: HighchartsLineSeriesOptions(color: '#FF0000'),
          ),
        ],
        plotOptions: HighchartsPlotOptions(
          series: HighchartsSeriesOptions(
            point: HighchartsSeriesPointOptions(
              events: HighchartsSeriesPointEventsOptions(
                click: HighchartsCallback((args) {
                  final point = args[0];
                  debugPrint('Point value: ${point['x']}, ${point['y']}');
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
