import "package:intl/intl.dart";
import "package:json_app/app/components/sync/linear_chart/sync_linear_graph.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:syncfusion_flutter_charts/charts.dart";

part "sync_linear_graph_builder.g.dart";

@jsonWidget
abstract class _SyncLinearGraphBuilder extends JsonWidgetBuilder {
  const _SyncLinearGraphBuilder({required super.args});

  @override
  SyncLinearGraph buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });

  Map<String, dynamic> mapDynamicToMapStringDynamic(dynamic input) {
    if (input is Map<dynamic, dynamic>) {
      return input.map((key, value) => MapEntry(key.toString(), value));
    }
    throw Exception("Esperado um Map para conversão");
  }

  @JsonArgDecoder("height")
  double _height({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value == null) {
      return 0.0;
    }
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    throw Exception("Invalid type for height: ${value.runtimeType}");
  }

  @JsonArgDecoder("cartesianSeries")
  List<CartesianSeries<dynamic, dynamic>> _decodeCartesianSeries({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) {
      return [];
    }

    return value.map<CartesianSeries<dynamic, dynamic>>((item) {
      if (item is CartesianSeries) {
        return item;
      }

      if (item is! Map) {
        throw Exception(
          "Item da cartesianSeries deve ser Map<String, dynamic> ou CartesianSeries",
        );
      }

      final Map<String, dynamic> itemMap = mapDynamicToMapStringDynamic(item);

      final type = itemMap["type"] ?? "line";

      final rawData = itemMap["dataSource"] as List? ?? [];

      final dataSource = rawData
          .map<Map<String, dynamic>>((e) => mapDynamicToMapStringDynamic(e))
          .toList();

      final xField = itemMap["xField"] ?? "x";
      final yField = itemMap["yField"] ?? "y";

      dynamic xValueMapper(dynamic data, _) {
        final raw = data[xField];
        if (type == "spline" && raw is String) {
          return DateTime.tryParse(raw);
        }
        return raw;
      }

      num yValueMapper(dynamic data, _) {
        final yValue = data[yField];
        if (yValue is num) {
          return yValue;
        }
        throw Exception("yValue não é numérico: $yValue");
      }

      switch (type) {
        case "spline":
          final dynamic colorValue = itemMap["pointColorMapper"];

          if (colorValue is String && colorValue.isNotEmpty) {}
          return SplineSeries<dynamic, dynamic>(
            dataSource: dataSource,
            xValueMapper: xValueMapper,
            yValueMapper: yValueMapper,
            name: itemMap["name"] ?? "",
            yAxisName: itemMap["yAxisName"],
            xAxisName: itemMap["xAxisName"],
            animationDuration: 0,
            legendIconType: LegendIconType.diamond,
            markerSettings: const MarkerSettings(isVisible: false),
          );
        default:
          throw Exception("Tipo de série não suportado: $type");
      }
    }).toList();
  }

  @JsonArgDecoder("chartAxis")
  List<ChartAxis> _decodeChartAxis({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) {
      return [];
    }

    return value.map<ChartAxis>((axis) {
      if (axis is ChartAxis) {
        return axis;
      }

      if (axis is! Map) {
        throw Exception(
          "chartAxis deve ser uma lista de Map<String, dynamic> ou ChartAxis",
        );
      }

      // Cast seguro para Map<String, dynamic>
      final Map<String, dynamic> axisMap = mapDynamicToMapStringDynamic(axis);

      final String type = axisMap["type"] ?? "numeric";

      switch (type) {
        case "numeric":
          return NumericAxis(
            name: axisMap["name"].toString(),
            minimum: double.tryParse(axisMap["minimum"].toString()),
            maximum: double.tryParse(axisMap["maximum"].toString()),
            interval: double.tryParse(axisMap["interval"].toString()),
            title: AxisTitle(text: axisMap["title"] ?? ""),
            opposedPosition:
                axisMap["opposedPosition"] == true ||
                axisMap["opposedPosition"]?.toString().toLowerCase() == "true",

            plotBands:
                (axisMap["plotBands"] as List?)
                    ?.map((e) => _parsePlotBand(Map<String, dynamic>.from(e)))
                    .toList() ??
                [],
          );
        case "category":
          return CategoryAxis(title: AxisTitle(text: axisMap["title"] ?? ""));
        default:
          throw Exception("Tipo de eixo não suportado: $type");
      }
    }).toList();
  }

  @JsonArgDecoder("chartAxisX")
  ChartAxis _decodeChartAxisX({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is ChartAxis) {
      return value;
    }

    if (value is! Map) {
      throw Exception(
        "chartAxisX deve ser um Map<String, dynamic> ou ChartAxis",
      );
    }

    final Map<String, dynamic> axisMap = mapDynamicToMapStringDynamic(value);

    final String type = axisMap["type"] ?? "category";

    switch (type) {
      case "numeric":
        return NumericAxis(
          title: AxisTitle(text: axisMap["title"] ?? ""),
          minimum: (axisMap["minimum"] as num?)?.toDouble(),
          maximum: (axisMap["maximum"] as num?)?.toDouble(),
        );
      case "datetime":
        return DateTimeAxis(
          isVisible: axisMap["isVisible"] ?? true,
          interval: axisMap["interval"],
          intervalType: _parseIntervalType(axisMap["intervalType"]),
          title: AxisTitle(text: axisMap["title"] ?? ""),
          dateFormat: _parseDateFormat(value["dateFormat"]),
        );
      case "category":
      default:
        return CategoryAxis(title: AxisTitle(text: axisMap["title"] ?? ""));
    }
  }

  PlotBand _parsePlotBand(Map<String, dynamic> map) {
    return PlotBand(
      shouldRenderAboveSeries: false,
      isVisible: map["isVisible"] ?? true,
      textAngle: (map["textAngle"] as num).toInt(),
      start: (map["start"] as num).toDouble(),
      end: (map["end"] as num).toDouble(),
      color: _parseHexColor(map["color"]) ?? Colors.red,
      text: map["text"] ?? "",
      horizontalTextAlignment: parseTextAnchor(map["horizontalTextAlignment"]),
      textStyle: TextStyle(
        fontSize: (map["fontSize"] as num).toDouble(),
        color: _parseHexColor(map["textColor"]) ?? Colors.black,
      ),
    );
  }

  TextAnchor parseTextAnchor(String? value) {
    switch (value) {
      case "0":
        return TextAnchor.start;
      case "1":
        return TextAnchor.middle;
      case "2":
        return TextAnchor.end;
      default:
        return TextAnchor.middle; // fallback
    }
  }

  Color? _parseHexColor(dynamic hex) {
    if (hex == null || hex is! String) {
      return null;
    }

    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    if (hex.length != 8) {
      return null;
    }

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (_) {
      return null;
    }
  }

  DateFormat? _parseDateFormat(dynamic value) {
    if (value is! String) {
      return null;
    }

    switch (value.toLowerCase()) {
      case "hm":
        return DateFormat.Hm();
      case "hms":
        return DateFormat.Hms();
      case "yMd":
        return DateFormat.yMd();
      case "yMMMd":
        return DateFormat.yMMMd();
      case "custom":
        return DateFormat("dd/MM/yyyy HH:mm");
      default:
        return null;
    }
  }

  DateTimeIntervalType _parseIntervalType(String? type) {
    switch (type?.toLowerCase()) {
      case "hours":
        return DateTimeIntervalType.hours;
      case "days":
        return DateTimeIntervalType.days;
      case "minutes":
        return DateTimeIntervalType.minutes;
      case "months":
        return DateTimeIntervalType.months;
      default:
        return DateTimeIntervalType.auto;
    }
  }
}
