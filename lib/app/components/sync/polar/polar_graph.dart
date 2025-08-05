import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class PolarGraphPage extends StatelessWidget {
  const PolarGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String option = '''
{
  color: ["#0001F7", "#00B8FE", "#00FFFF", "#00FF68", "#BEFE00", "#FFFF00", "#FFA800", "#E10100"],
  angleAxis: {
    type: 'category',
    data: ['N', 'NE', 'L', 'SE', 'S', 'SO', 'O', 'NO'],
    startAngle: 90,
    boundaryGap: false,
    axisTick: { show: false },
    axisLine: { show: false },
    axisLabel: { show: true },
    splitLine: {
      show: true,
      lineStyle: {
        color: 'black' // linhas radiais pretas
      }
    }
  },
  radiusAxis: {
    axisLabel: { show: false },
    axisTick: { show: false },
    axisLine: { show: false },
    splitLine: {
      show: false,
      lineStyle: {
        color: 'black' // círculos concêntricos pretos
      }
    }
  },
  polar: {},
  series: [
    {
      type: 'bar',
      data: [1, 2, 3, 4, 3, 5, 1, 2, 1],
      coordinateSystem: 'polar',
      name: 'A',
      stack: 'a',
      emphasis: { focus: 'series' }
    },
    {
      type: 'bar',
      data: [2, 4, 6, 1, 3, 2, 1, 1, 2],
      coordinateSystem: 'polar',
      name: 'B',
      stack: 'a',
      emphasis: { focus: 'series' }
    },
    {
      type: 'bar',
      data: [1, 2, 3, 4, 1, 2, 5, 3, 1],
      coordinateSystem: 'polar',
      name: 'C',
      stack: 'a',
      emphasis: { focus: 'series' }
    }
  ],
  legend: {
    show: true,
    data: ['A', 'B', 'C']
  }
}
''';
    return Scaffold(
      body: Center(
        child: SizedBox(height: 300, child: Echarts(option: option)),
      ),
    );
  }
}
