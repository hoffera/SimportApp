import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part 'export_sync.g.dart';

@jsonWidget
abstract class _SfCartesianChartBuilder extends JsonWidgetBuilder {
  const _SfCartesianChartBuilder({required super.args});

  @override
  SfCartesianChart buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
