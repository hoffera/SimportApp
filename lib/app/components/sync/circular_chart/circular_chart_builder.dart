import "package:json_app/app/components/sync/circular_chart/circular_chart.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

part "circular_chart_builder.g.dart";

@jsonWidget
abstract class _CircularChartBuilder extends JsonWidgetBuilder {
  const _CircularChartBuilder({required super.args});

  @override
  CircularChart buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });

  @JsonArgDecoder("height")
  double _height({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value == null) {
      return 300.0;
    }
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value) ?? 300.0;
    }
    throw Exception("Invalid type for height: ${value.runtimeType}");
  }

  @JsonArgDecoder("angleDegrees")
  double _angleDegrees({
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
    throw Exception("Invalid type for angleDegrees: ${value.runtimeType}");
  }

  @JsonArgDecoder("title")
  String _title({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value == null) {
      return "0°";
    }
    if (value is String) {
      return value;
    }
    return value.toString();
  }

  @JsonArgDecoder("subtitle")
  String? _subtitle({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value == null) {
      return null;
    }
    if (value is String) {
      return value.isEmpty ? null : value;
    }
    return value.toString();
  }

  @JsonArgDecoder("arrowOutward")
  bool _arrowOutward({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value == null) {
      return false;
    }
    if (value is bool) {
      return value;
    }
    if (value is String) {
      return value.toLowerCase() == "true";
    }
    if (value is int) {
      return value != 0;
    }
    return false;
  }
}
