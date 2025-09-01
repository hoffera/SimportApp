import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:syncfusion_flutter_charts/charts.dart";

class SyncLinearGraph extends StatefulWidget {
  const SyncLinearGraph({
    super.key,
    required this.cartesianSeries,
    required this.chartAxis,
    required this.chartAxisX,
    this.height,
  });

  final List<CartesianSeries> cartesianSeries;
  final List<ChartAxis> chartAxis;
  final ChartAxis chartAxisX;
  final double? height;

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      enableAxisAnimation: false,
      zoomPanBehavior: _zoomPanBehavior,
      trackballBehavior: _trackballBehavior,
      legend: Legend(isVisible: true, position: LegendPosition.top),
      plotAreaBorderWidth: 0,
      primaryXAxis: widget.chartAxisX,
      primaryYAxis: NumericAxis(isVisible: false),
      axes: widget.chartAxis,
      series: widget.cartesianSeries,
    );
  }
}

class ChartData {
  ChartData({this.xDate, this.x, required this.y, required this.label});

  final String label;
  final String? x;
  final DateTime? xDate;
  final double y;
}

class RangeData {
  RangeData(this.xValue, this.lowValue, this.highValue);
  final DateTime xValue;
  final int lowValue;
  final int highValue;
}
