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
            {"x": "2024-01-01", "y": 12},
            {"x": "2024-01-02", "y": 15},
            {"x": "2024-01-03", "y": 14},
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
