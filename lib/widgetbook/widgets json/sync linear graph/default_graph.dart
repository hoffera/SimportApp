import "dart:convert";
import "dart:ui";

String getDefaultGraphJson(
  String seriesName,
  String yAxisInterval,
  String yAxisMaximum,
  String yAxisMinimum,
  String yAxisTitle,
  String showXAxis,
  String xAxisInterval,
  String height,
) {
  final data = {
    "type": "sync_linear_graph",
    "args": {
      "height": height,
      "cartesianSeries": [
        {
          "type": "spline",
          "name": seriesName,
          "xField": "x",
          "yField": "y",
          "dataSource": [
            {"x": 1691337600, "y": 2},
            {"x": 1691341200, "y": 4},
            {"x": 1691344800, "y": 2},
            {"x": 1691348400, "y": 4},
            {"x": 1691352000, "y": 10},
          ],
          "yAxisName": seriesName,
        },
      ],
      "chartAxis": [
        {
          "name": seriesName,
          "type": "numeric",
          "title": yAxisTitle,
          "minimum": yAxisMinimum,
          "maximum": yAxisMaximum,
          "interval": yAxisInterval,
        },
      ],
      "chartAxisX": {
        "type": "datetime",

        "intervalType": "hours",
        "dateFormat": "Hm",
      },
    },
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}

String getMultipleGraphJson(
  String seriesName,
  String yAxisInterval,
  String yAxisMaximum,
  String yAxisMinimum,
  String yAxisTitle,
  String showXAxis,
  String xAxisInterval,
  String height,
  String seriesName2,
) {
  final data = {
    "type": "sync_linear_graph",
    "args": {
      "height": height,
      "cartesianSeries": [
        {
          "type": "spline",
          "name": seriesName,
          "xField": "x",
          "yField": "y",
          "yAxisName": seriesName,
          "dataSource": [
            {"x": 1691337600, "y": 1},
            {"x": 1691341200, "y": 2},
            {"x": 1691344800, "y": 5},
            {"x": 1691348400, "y": 2},
            {"x": 1691352000, "y": 1},
          ],
        },
        {
          "type": "spline",
          "name": seriesName2,
          "xField": "x",
          "yField": "y",
          "yAxisName": seriesName,
          "dataSource": [
            {"x": 1691337600, "y": 2},
            {"x": 1691341200, "y": 4},
            {"x": 1691344800, "y": 6},
            {"x": 1691348400, "y": 8},
            {"x": 1691352000, "y": 10},
          ],
        },
      ],
      "chartAxis": [
        {
          "type": "numeric",
          "title": yAxisTitle,
          "minimum": yAxisMinimum,
          "maximum": yAxisMaximum,
          "interval": yAxisInterval,
          "name": seriesName,
        },
      ],
      "chartAxisX": {
        "type": "datetime",

        "intervalType": "hours",
        "dateFormat": "Hm",
      },
    },
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}

String getMultipleUnityGraphJson(
  String seriesName,
  String yAxisInterval,
  String yAxisMaximum,
  String yAxisMinimum,
  String yAxisTitle,
  String showXAxis,
  String xAxisInterval,
  String height,

  String seriesName2,
  String yAxisInterval2,
  String yAxisMaximum2,
  String yAxisMinimum2,
  String yAxisTitle2,
) {
  final data = {
    "type": "sync_linear_graph",
    "args": {
      "height": height,
      "cartesianSeries": [
        {
          "type": "spline",
          "name": seriesName,
          "xField": "x",
          "yField": "y",
          "yAxisName": seriesName,
          "dataSource": [
            {"x": 1691337600, "y": 1},
            {"x": 1691341200, "y": 2},
            {"x": 1691344800, "y": 3},
            {"x": 1691348400, "y": 4},
            {"x": 1691352000, "y": 5},
          ],
        },

        {
          "type": "spline",
          "name": seriesName2,
          "yAxisName": seriesName2,
          "xField": "x",
          "yField": "y",
          "dataSource": [
            {"x": 1691337600, "y": 20},
            {"x": 1691341200, "y": 40},
            {"x": 1691344800, "y": 60},
            {"x": 1691348400, "y": 80},
            {"x": 1691352000, "y": 10},
          ],
        },
      ],
      "chartAxis": [
        {
          "type": "numeric",
          "name": seriesName,
          "title": yAxisTitle,
          "minimum": yAxisMinimum,
          "maximum": yAxisMaximum,
          "interval": yAxisInterval,
          "opposedPosition": "false",
        },
        {
          "type": "numeric",
          "name": seriesName2,
          "title": yAxisTitle2,
          "minimum": yAxisMinimum2,
          "maximum": yAxisMaximum2,
          "interval": yAxisInterval2,
          "opposedPosition": "true",
        },
      ],
      "chartAxisX": {
        "type": "datetime",

        "intervalType": "hours",
        "dateFormat": "Hm",
      },
    },
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}

String colorToHex(Color color) {
  return "#${color.toARGB32().toRadixString(16).padLeft(8, "0").toUpperCase()}";
}

String getPlotband(
  double start,
  double end,
  int angle,
  String text,
  Color color,
  String horizontalTextAlignment,
  double fontSize,
  Color textColor,
) {
  final plotBandList = [
    {
      "isVisible": true,
      "start": start,
      "end": end,
      "text": text,
      "textAngle": angle,
      "color": colorToHex(color),
      "horizontalTextAlignment": horizontalTextAlignment,
      "fontSize": fontSize,
      "textColor": colorToHex(textColor),
    },
  ];

  final jsonList = const JsonEncoder.withIndent("  ").convert(plotBandList);

  return '"plotBands": $jsonList';
}

String getScatterGraphJson(
  String seriesName,
  String yAxisInterval,
  String yAxisMaximum,
  String yAxisMinimum,
  String yAxisTitle,
  String showXAxis,
  String xAxisInterval,
  String height,
) {
  final data = {
    "type": "sync_linear_graph",
    "args": {
      "height": height,
      "cartesianSeries": [
        {
          "type": "scatter",
          "name": seriesName,
          "xField": "x",
          "yField": "y",
          "yAxisName": seriesName,
          "dataSource": [
            {"x": 1691337600, "y": 1},
            {"x": 1691341200, "y": 2},
            {"x": 1691344800, "y": 3},
            {"x": 1691348400, "y": 4},
            {"x": 1691352000, "y": 5},
          ],
        },
      ],
      "chartAxis": [
        {
          "type": "numeric",
          "name": seriesName,
          "title": yAxisTitle,
          "minimum": yAxisMinimum,
          "maximum": yAxisMaximum,
          "interval": yAxisInterval,
        },
      ],
      "chartAxisX": {
        "type": "datetime",

        "intervalType": "hours",
        "dateFormat": "Hm",
      },
    },
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}

String getRangeGraphJson(
  String seriesName,
  String yAxisInterval,
  String yAxisMaximum,
  String yAxisMinimum,
  String yAxisTitle,
  String showXAxis,
  String xAxisInterval,
  String height,
  Color color,
  Color borderColor,
) {
  final data = {
    "type": "sync_linear_graph",
    "args": {
      "height": height,
      "cartesianSeries": [
        {
          "type": "rangeArea",
          "name": seriesName,
          "xField": "x",

          "yAxisName": seriesName,
          "dataSource": [
            {"x": 1691337600, "lowValue": 8, "highValue": 12.0},
            {"x": 1691341200, "lowValue": 9, "highValue": 13.0},
            {"x": 1691344800, "lowValue": 18, "highValue": 20.0},
            {"x": 1691348400, "lowValue": 9, "highValue": 15.0},
            {"x": 1691352000, "lowValue": 20, "highValue": 30.0},
          ],
          "borderColor": colorToHex(borderColor),
          "color": colorToHex(color),
        },
      ],
      "chartAxis": [
        {
          "type": "numeric",
          "name": seriesName,
          "title": yAxisTitle,
          "minimum": yAxisMinimum,
          "maximum": yAxisMaximum,
          "interval": yAxisInterval,
        },
      ],
      "chartAxisX": {
        "type": "datetime",

        "intervalType": "hours",
        "dateFormat": "Hm",
      },
    },
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}

String getDashedGraphJson(double dashArray1, double dashArray2) {
  final data = {
    "type": "spline",
    "name": "seriesName",
    "xField": "x",
    "yField": "y",
    "dataSource": [
      {"x": 1691337600, "y": 1},
      {"x": 1691341200, "y": 2},
      {"x": 1691344800, "y": 3},
      {"x": 1691348400, "y": 4},
      {"x": 1691352000, "y": 5},
    ],
    "dashArray": [dashArray1, dashArray2],
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}
