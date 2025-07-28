// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part 'sync_linear_graph.g.dart';

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
    throw Exception('Esperado um Map para conversão');
  }

  @JsonArgDecoder('cartesianSeries')
  List<CartesianSeries<dynamic, dynamic>> _decodeCartesianSeries({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) return [];

    return value.map<CartesianSeries<dynamic, dynamic>>((item) {
      if (item is CartesianSeries) return item;

      if (item is! Map) {
        throw Exception(
          'Item da cartesianSeries deve ser Map<String, dynamic> ou CartesianSeries',
        );
      }

      final Map<String, dynamic> itemMap = mapDynamicToMapStringDynamic(item);

      final type = itemMap['type'] ?? 'line';

      final rawData = itemMap['dataSource'] as List? ?? [];

      final dataSource = rawData
          .map<Map<String, dynamic>>((e) => mapDynamicToMapStringDynamic(e))
          .toList();

      final xField = itemMap['xField'] ?? 'x';
      final yField = itemMap['yField'] ?? 'y';

      dynamic xValueMapper(dynamic data, _) {
        final raw = data[xField];
        if (type == 'spline' && raw is String) {
          return DateTime.tryParse(raw);
        }
        return raw;
      }

      num yValueMapper(dynamic data, _) {
        final yValue = data[yField];
        if (yValue is num) return yValue;
        throw Exception('yValue não é numérico: $yValue');
      }

      switch (type) {
        case 'spline':
          final dynamic colorValue = itemMap['pointColorMapper'];
          Color? pointColor;

          if (colorValue is String && colorValue.isNotEmpty) {
            pointColor = _parseHexColor(colorValue);
          }
          return SplineSeries<dynamic, dynamic>(
            dataSource: dataSource,
            xValueMapper: xValueMapper,
            yValueMapper: yValueMapper,
            name: itemMap['name'] ?? '',
            pointColorMapper: pointColor != null
                ? (data, _) => pointColor
                : null,
            color: itemMap.containsKey('color') && itemMap['color'] is String
                ? _parseHexColor(itemMap['color'])
                : null,
            yAxisName: itemMap['yAxisName'],
            xAxisName: itemMap['xAxisName'],
            animationDuration: 0,
            legendIconType: LegendIconType.diamond,
            markerSettings: const MarkerSettings(isVisible: false),
          );
        default:
          throw Exception('Tipo de série não suportado: $type');
      }
    }).toList();
  }

  @JsonArgDecoder('chartAxis')
  List<ChartAxis> _decodeChartAxis({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) {
      print('chartAxis não é lista: $value');
      return [];
    }

    return value.map<ChartAxis>((axis) {
      if (axis is ChartAxis) return axis;

      if (axis is! Map) {
        throw Exception(
          'chartAxis deve ser uma lista de Map<String, dynamic> ou ChartAxis',
        );
      }

      // Cast seguro para Map<String, dynamic>
      final Map<String, dynamic> axisMap = mapDynamicToMapStringDynamic(axis);

      final String type = axisMap['type'] ?? 'numeric';

      switch (type) {
        case 'numeric':
          return NumericAxis(
            minimum: (axisMap['minimum'] as num?)?.toDouble(),
            maximum: (axisMap['maximum'] as num?)?.toDouble(),
            title: AxisTitle(text: axisMap['title'] ?? ''),

            plotBands:
                (axisMap['plotBands'] as List?)
                    ?.map((e) => _parsePlotBand(Map<String, dynamic>.from(e)))
                    .toList() ??
                [],
          );
        case 'category':
          return CategoryAxis(title: AxisTitle(text: axisMap['title'] ?? ''));
        default:
          throw Exception('Tipo de eixo não suportado: $type');
      }
    }).toList();
  }

  @JsonArgDecoder('chartAxisX')
  ChartAxis _decodeChartAxisX({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is ChartAxis) return value;

    if (value is! Map) {
      throw Exception(
        'chartAxisX deve ser um Map<String, dynamic> ou ChartAxis',
      );
    }

    final Map<String, dynamic> axisMap = mapDynamicToMapStringDynamic(value);

    final String type = axisMap['type'] ?? 'category';

    switch (type) {
      case 'numeric':
        return NumericAxis(
          title: AxisTitle(text: axisMap['title'] ?? ''),
          minimum: (axisMap['minimum'] as num?)?.toDouble(),
          maximum: (axisMap['maximum'] as num?)?.toDouble(),
        );
      case 'datetime':
        return DateTimeAxis(
          isVisible: axisMap['isVisible'] ?? true,
          interval: axisMap['interval'],
          intervalType: _parseIntervalType(axisMap['intervalType']),
          title: AxisTitle(text: axisMap['title'] ?? ''),
          dateFormat: _parseDateFormat(value['dateFormat']),
        );
      case 'category':
      default:
        return CategoryAxis(title: AxisTitle(text: axisMap['title'] ?? ''));
    }
  }

  PlotBand _parsePlotBand(Map<String, dynamic> map) {
    return PlotBand(
      shouldRenderAboveSeries: false,
      isVisible: map['isVisible'] ?? true,
      start: (map['start'] as num).toDouble(),
      end: (map['end'] as num).toDouble(),
      color: _parseHexColor(map['color']) ?? Colors.red,
      text: map['text'] ?? '',
    );
  }

  Color? _parseHexColor(dynamic hex) {
    if (hex == null || hex is! String) return null;

    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (_) {
      return null;
    }
  }

  DateFormat? _parseDateFormat(dynamic value) {
    if (value is! String) return null;

    switch (value.toLowerCase()) {
      case 'hm':
        return DateFormat.Hm();
      case 'hms':
        return DateFormat.Hms();
      case 'yMd':
        return DateFormat.yMd();
      case 'yMMMd':
        return DateFormat.yMMMd();
      case 'custom':
        return DateFormat('dd/MM/yyyy HH:mm');
      default:
        return null;
    }
  }

  DateTimeIntervalType _parseIntervalType(String? type) {
    switch (type?.toLowerCase()) {
      case 'hours':
        return DateTimeIntervalType.hours;
      case 'days':
        return DateTimeIntervalType.days;
      case 'minutes':
        return DateTimeIntervalType.minutes;
      case 'months':
        return DateTimeIntervalType.months;
      default:
        return DateTimeIntervalType.auto;
    }
  }
}

class SyncLinearGraph extends StatefulWidget {
  const SyncLinearGraph({
    super.key,
    required this.cartesianSeries,
    required this.chartAxis,
    required this.chartAxisX,
  });

  final List<CartesianSeries> cartesianSeries;
  final List<ChartAxis> chartAxis;
  final ChartAxis chartAxisX;

  @override
  State<SyncLinearGraph> createState() => _SyncLinearGraphState();
}

class _SyncLinearGraphState extends State<SyncLinearGraph> {
  late TrackballBehavior _trackballBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior(
      enableDirectionalZooming: true,
      enablePinching: true,
      zoomMode: ZoomMode.x,
    );

    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      tooltipSettings: InteractiveTooltip(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.white,
      enableAxisAnimation: false,
      zoomPanBehavior: _zoomPanBehavior,
      legend: Legend(isVisible: true),
      plotAreaBorderWidth: 0,
      primaryXAxis: widget.chartAxisX,
      primaryYAxis: NumericAxis(isVisible: false),
      axes: widget.chartAxis,
      trackballBehavior: _trackballBehavior,
      series: widget.cartesianSeries,
    );
  }
}

class ChartData {
  ChartData({
    this.xDate,
    this.x,
    required this.y,
    required this.color,
    required this.label,
  });

  final Color color;
  final String label;
  final String? x;
  final DateTime? xDate;
  final double y;
}
