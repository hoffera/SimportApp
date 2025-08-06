import "dart:convert";
import "dart:ui";

String getDefaultCircularChartJson({
  double angleDegrees = 0.0,
  double height = 300.0,
  String title = "0°",
  String? subtitle,
  bool arrowOutward = false,
}) {
  final data = {
    "type": "circular_chart",
    "args": {
      "height": height,
      "angleDegrees": angleDegrees,
      "title": title,
      if (subtitle != null) "subtitle": subtitle,
      "arrowOutward": arrowOutward,
    },
  };

  return const JsonEncoder.withIndent("  ").convert(data);
}
