import "package:json_app/app/components/chart/chart_widget.dart";
import "package:json_app/app/components/sync/polar/polar_graph.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CristalyzePageScreen extends StatefulWidget {
  const CristalyzePageScreen({super.key});

  @override
  State<CristalyzePageScreen> createState() => CristalyzePageScreenState();
}

class CristalyzePageScreenState extends State<CristalyzePageScreen> {
  @override
  Widget build(BuildContext context) {
    String series = """
{type: 'bar',
      data: [0.5, 0.6, 0.7, 0, 0.9, 0, 0.8,0],
      coordinateSystem: 'polar',
      name: '0.5 - 1',
      stack: 'a',
      emphasis: { 
        focus: 'none',
        itemStyle: {
          shadowBlur: 10,
          shadowColor: 'rgba(0,0,0,0.3)'
        }
      }},
      {type: 'bar',
      data: [1.1, 1.1, 1.2, 0, 1.4, 0, 1.3, 1.1],
      coordinateSystem: 'polar',
      name: '1 - 1.5',
      stack: 'a',
      emphasis: { 
        focus: 'none',
        itemStyle: {
          shadowBlur: 10,
          shadowColor: 'rgba(0,0,0,0.3)'
        }
      }}
    """;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400,
            child: ChartWidget(
              chart: SizedBox(
                height: 300,
                child: Center(child: PolarChart(series: series)),
              ),
              title: "Direção do vento",
              subtitle: "Direção do vento",
            ),
          ),
        ),
      ),
    );
  }
}
