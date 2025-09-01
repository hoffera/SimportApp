import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_echarts/flutter_echarts.dart";

class VectorGraphPage extends StatelessWidget {
  const VectorGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> windData = [
      // 05:00
      {
        "value": [DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch, 5, 0, 10],
        "itemStyle": {
          "color": "#FF0000",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch, 6, 36, 11],
        "itemStyle": {
          "color": "#00FF00",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch, 7, 72, 12],
        "itemStyle": {
          "color": "#0000FF",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          8,
          108,
          13,
        ],
        "itemStyle": {
          "color": "#FFA500",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          9,
          144,
          14,
        ],
        "itemStyle": {
          "color": "#800080",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          10,
          180,
          15,
        ],
        "itemStyle": {
          "color": "#00CED1",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          11,
          216,
          16,
        ],
        "itemStyle": {
          "color": "#FF69B4",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          12,
          252,
          17,
        ],
        "itemStyle": {
          "color": "#A52A2A",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          13,
          288,
          18,
        ],
        "itemStyle": {
          "color": "#ADFF2F",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 0).millisecondsSinceEpoch,
          14,
          324,
          19,
        ],
        "itemStyle": {
          "color": "#20B2AA",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },

      // 05:15
      {
        "value": [DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch, 5, 0, 10],
        "itemStyle": {
          "color": "#FF0000",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          6,
          36,
          11,
        ],
        "itemStyle": {
          "color": "#00FF00",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          7,
          72,
          12,
        ],
        "itemStyle": {
          "color": "#0000FF",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          8,
          108,
          13,
        ],
        "itemStyle": {
          "color": "#FFA500",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          9,
          144,
          14,
        ],
        "itemStyle": {
          "color": "#800080",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          10,
          180,
          15,
        ],
        "itemStyle": {
          "color": "#00CED1",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          11,
          216,
          16,
        ],
        "itemStyle": {
          "color": "#FF69B4",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          12,
          252,
          17,
        ],
        "itemStyle": {
          "color": "#A52A2A",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          13,
          288,
          18,
        ],
        "itemStyle": {
          "color": "#ADFF2F",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 15).millisecondsSinceEpoch,
          14,
          324,
          19,
        ],
        "itemStyle": {
          "color": "#20B2AA",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },

      // 05:30
      {
        "value": [DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch, 5, 0, 10],
        "itemStyle": {
          "color": "#FF0000",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          6,
          36,
          11,
        ],
        "itemStyle": {
          "color": "#00FF00",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          7,
          72,
          12,
        ],
        "itemStyle": {
          "color": "#0000FF",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          8,
          108,
          13,
        ],
        "itemStyle": {
          "color": "#FFA500",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          9,
          144,
          14,
        ],
        "itemStyle": {
          "color": "#800080",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          10,
          180,
          15,
        ],
        "itemStyle": {
          "color": "#00CED1",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          11,
          216,
          16,
        ],
        "itemStyle": {
          "color": "#FF69B4",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          12,
          252,
          17,
        ],
        "itemStyle": {
          "color": "#A52A2A",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          13,
          288,
          18,
        ],
        "itemStyle": {
          "color": "#ADFF2F",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
      {
        "value": [
          DateTime(2023, 1, 1, 5, 30).millisecondsSinceEpoch,
          14,
          324,
          19,
        ],
        "itemStyle": {
          "color": "#20B2AA",
          "borderColor": "#000000",
          "borderWidth": 1,
        },
      },
    ];

    final String dataJson = jsonEncode(windData);

    final String option =
        '''
{

  "tooltip": {
    "trigger": "item",
    "formatter": function(params) {
      return (
        "Hora: " + new Date(params.value[0]).toLocaleTimeString() + "<br>" +
        "Velocidade: " + params.value[1] + " nós<br>" +
        "Direção: " + params.value[2] + "°"
      );
    }
  },
  "xAxis": {
    "type": "time",
    "min": ${DateTime(2023, 1, 1, 4, 50).millisecondsSinceEpoch},
    "splitNumber": 4
  },
  "yAxis": {
    "type": "value",
    "name": "Velocidade (nós)"
  },
  "dataZoom": [
    {
      "type": "inside",
      "xAxisIndex": 0,
      "start": 0,
      "end": 100
    }
  ],
  "series": [
    {
      "type": "scatter",
      "symbol": "path://M31 16l-15-15v9h-26v12h26v9z",
      "encode": {
        "x": 0,
        "y": 1
      },
      "symbolRotate": function(value) {
        return value[2];
      },
      "symbolSize": function(value) {
        return value[3];
      },
      "data": $dataJson
    }
  ]
}
''';
    return Scaffold(
      body: Center(
        child: SizedBox(height: 300, child: Echarts(option: option)),
      ),
    );
  }
}
