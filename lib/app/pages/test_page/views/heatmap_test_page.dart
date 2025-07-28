import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_app/app/models/forecast_model.dart';
import 'package:json_app/components/simport/heatmap/heatmap_widget.dart';
import 'package:json_app/services/forecast_service.dart';

class HeatMapTestPage extends StatefulWidget {
  const HeatMapTestPage({super.key});

  @override
  State<HeatMapTestPage> createState() => _HeatMapTestPageState();
}

class _HeatMapTestPageState extends State<HeatMapTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<List<Forecast>>(
                future: ForecastService.fetchDados(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhum dado encontrado.'));
                  }

                  final forecast = snapshot.data!;

                  print(forecast[1].windDirection?.ceil());
                  print(forecast.first.windGust?.ceil());
                  print(forecast.first.windSpeed?.ceil());

                  final List<String> time = forecast
                      .map((e) {
                        final sec = e.date?.sec;
                        if (sec == null) return null;

                        final dateTime = DateTime.fromMillisecondsSinceEpoch(
                          sec * 1000,
                        ).toLocal();
                        final formattedTime = DateFormat.H().format(dateTime);

                        return formattedTime;
                      })
                      .whereType<String>()
                      .toList();

                  HeatmapD windDirection = HeatmapD(
                    label: 'Direção do Vento',
                    color: [],
                    dados: forecast
                        .map((f) => f.windDirection.toString())
                        .toList(),
                  );
                  HeatmapD windGust = HeatmapD(
                    color: [],
                    label: 'windGust',
                    dados: forecast.map((f) => f.windGust.toString()).toList(),
                  );
                  HeatmapD windSpeed = HeatmapD(
                    color: [],
                    label: 'windSpeed',
                    dados: forecast.map((f) => f.windSpeed.toString()).toList(),
                  );

                  List<HeatmapD> list = [
                    windDirection,
                    windGust,
                    windSpeed,
                    windGust,
                    windSpeed,
                    windGust,
                    windSpeed,
                    windGust,
                    windSpeed,
                    windGust,
                    windSpeed,
                  ];

                  return HeatmapWidget(data: list, time: time);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
