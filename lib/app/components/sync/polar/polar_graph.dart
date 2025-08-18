import "package:flutter/material.dart";
import "package:flutter_echarts/flutter_echarts.dart";

class PolarChart extends StatelessWidget {
  final String? fullOption;
  final String? series;

  const PolarChart({super.key, this.series, this.fullOption});

  @override
  Widget build(BuildContext context) {
    final option =
        ''' 
{
  grid: [
    { left: '7%', top: '7%', width: '38%', height: '50%' }

  ],
  color: ["#0001F7", "#00B8FE", "#00FFFF", "#00FF68", "#BEFE00", "#FFFF00", "#FFA800", "#E10100"],
  tooltip: {
    trigger: 'item',
    formatter: function(params) {
      let option = params.vars ? null : chart.getOption();
      let values = option.series[params.seriesIndex].data;
      let total = values.reduce((a, b) => a + b, 0);
      let percent = ((params.value / total) * 100).toFixed(1);
      return '<b>' + params.value + '</b>' + '<br/>' +
            params.seriesName + ': ' + '<b>' + percent + '%</b>';
    }
  },
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
        color: '#ccc'
      }
    }
  },
  radiusAxis: {
    axisLabel: { show: false },
    axisTick: { show: false },
    axisLine: { show: false },
    splitLine: {
      show: true,
      lineStyle: {
        color: '#ccc'
      }
    }
  },
  polar: {
    center: ['40%', '40%'],
    radius: '65%'
  },
  series: [
    ${series!}
  ],
  legend: {
    show: true,
    orient: 'vertical', 
    right: 0,         
    top: '32%'
  }
}
''';

    return Echarts(
      option: option,
      extraScript: """
            chart.on('click', function (params) {
              console.log('Clicked:', params);
            });
          """,
    );
  }
}
