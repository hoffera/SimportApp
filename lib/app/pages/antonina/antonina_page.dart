import 'package:flutter/material.dart';
import 'package:json_app/app/models/chart_1885_model.dart';
import 'package:json_app/components/cards/commom_card.dart' show CommomCard;
import 'package:json_app/components/simport/circular_graph.dart';
import 'package:json_app/components/text/title_widget.dart';
import 'package:json_app/services/chart_service.dart';

class AntoninaPage extends StatelessWidget {
  const AntoninaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Chart1885>>(
        future: ChartService.fetchDados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }

          final charts = snapshot.data!;
          final lastChart = charts.last;

          print(lastChart);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  TitleWidget(title: "Vento"),
                  SizedBox(height: 100),
                  CommomCard(
                    title: "Mare",
                    subtitle: "ha 10 minutos",
                    iconURL:
                        'https://appa.cs.simport.com.br/gallery/33/image-download',
                  ),
                  CircularGraph(
                    angleDegrees: lastChart.windDirectionAverage!.toDouble(),
                    title: lastChart.windDirectionAverageDescAbv!,
                    pointerColor: Colors.black,
                    arrowOutward: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
