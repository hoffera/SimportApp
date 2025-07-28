// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_sync.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class SfCartesianChartBuilder extends _SfCartesianChartBuilder {
  const SfCartesianChartBuilder({required super.args});

  static const kType = 'sf_cartesian_chart';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SfCartesianChartBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => SfCartesianChartBuilder(args: map);

  @override
  SfCartesianChartBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SfCartesianChartBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SfCartesianChart buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return SfCartesianChart(
      annotations: model.annotations,
      axes: model.axes,
      backgroundColor: model.backgroundColor,
      borderColor: model.borderColor,
      borderWidth: model.borderWidth,
      crosshairBehavior: model.crosshairBehavior,
      enableAxisAnimation: model.enableAxisAnimation,
      enableMultiSelection: model.enableMultiSelection,
      enableSideBySideSeriesPlacement: model.enableSideBySideSeriesPlacement,
      indicators: model.indicators,
      isTransposed: model.isTransposed,
      key: key,
      legend: model.legend,
      loadMoreIndicatorBuilder: model.loadMoreIndicatorBuilder,
      margin: model.margin,
      onActualRangeChanged: model.onActualRangeChanged,
      onAxisLabelTapped: model.onAxisLabelTapped,
      onChartTouchInteractionDown: model.onChartTouchInteractionDown,
      onChartTouchInteractionMove: model.onChartTouchInteractionMove,
      onChartTouchInteractionUp: model.onChartTouchInteractionUp,
      onCrosshairPositionChanging: model.onCrosshairPositionChanging,
      onDataLabelRender: model.onDataLabelRender,
      onDataLabelTapped: model.onDataLabelTapped,
      onLegendItemRender: model.onLegendItemRender,
      onLegendTapped: model.onLegendTapped,
      onMarkerRender: model.onMarkerRender,
      onPlotAreaSwipe: model.onPlotAreaSwipe,
      onSelectionChanged: model.onSelectionChanged,
      onTooltipRender: model.onTooltipRender,
      onTrackballPositionChanging: model.onTrackballPositionChanging,
      onZoomEnd: model.onZoomEnd,
      onZoomReset: model.onZoomReset,
      onZoomStart: model.onZoomStart,
      onZooming: model.onZooming,
      palette: model.palette,
      plotAreaBackgroundColor: model.plotAreaBackgroundColor,
      plotAreaBackgroundImage: model.plotAreaBackgroundImage,
      plotAreaBorderColor: model.plotAreaBorderColor,
      plotAreaBorderWidth: model.plotAreaBorderWidth,
      primaryXAxis: model.primaryXAxis,
      primaryYAxis: model.primaryYAxis,
      selectionGesture: model.selectionGesture,
      selectionType: model.selectionType,
      series: model.series,
      title: model.title,
      tooltipBehavior: model.tooltipBehavior,
      trackballBehavior: model.trackballBehavior,
      zoomPanBehavior: model.zoomPanBehavior,
    );
  }
}

class JsonSfCartesianChart extends JsonWidgetData {
  JsonSfCartesianChart({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.annotations,
    this.axes = const <ChartAxis>[],
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.crosshairBehavior,
    this.enableAxisAnimation = false,
    this.enableMultiSelection = false,
    this.enableSideBySideSeriesPlacement = true,
    this.indicators = const <TechnicalIndicator>[],
    this.isTransposed = false,
    this.legend = const Legend(),
    this.loadMoreIndicatorBuilder,
    this.margin = const EdgeInsets.all(10),
    this.onActualRangeChanged,
    this.onAxisLabelTapped,
    this.onChartTouchInteractionDown,
    this.onChartTouchInteractionMove,
    this.onChartTouchInteractionUp,
    this.onCrosshairPositionChanging,
    this.onDataLabelRender,
    this.onDataLabelTapped,
    this.onLegendItemRender,
    this.onLegendTapped,
    this.onMarkerRender,
    this.onPlotAreaSwipe,
    this.onSelectionChanged,
    this.onTooltipRender,
    this.onTrackballPositionChanging,
    this.onZoomEnd,
    this.onZoomReset,
    this.onZoomStart,
    this.onZooming,
    this.palette,
    this.plotAreaBackgroundColor,
    this.plotAreaBackgroundImage,
    this.plotAreaBorderColor,
    this.plotAreaBorderWidth = 0.7,
    this.primaryXAxis = const NumericAxis(),
    this.primaryYAxis = const NumericAxis(),
    this.selectionGesture = ActivationMode.singleTap,
    this.selectionType = SelectionType.point,
    this.series = const <CartesianSeries>[],
    this.title = const ChartTitle(),
    this.tooltipBehavior,
    this.trackballBehavior,
    this.zoomPanBehavior,
  }) : super(
         jsonWidgetArgs: SfCartesianChartBuilderModel.fromDynamic(
           {
             'annotations': annotations,
             'axes': axes,
             'backgroundColor': backgroundColor,
             'borderColor': borderColor,
             'borderWidth': borderWidth,
             'crosshairBehavior': crosshairBehavior,
             'enableAxisAnimation': enableAxisAnimation,
             'enableMultiSelection': enableMultiSelection,
             'enableSideBySideSeriesPlacement': enableSideBySideSeriesPlacement,
             'indicators': indicators,
             'isTransposed': isTransposed,
             'legend': legend,
             'loadMoreIndicatorBuilder': loadMoreIndicatorBuilder,
             'margin': margin,
             'onActualRangeChanged': onActualRangeChanged,
             'onAxisLabelTapped': onAxisLabelTapped,
             'onChartTouchInteractionDown': onChartTouchInteractionDown,
             'onChartTouchInteractionMove': onChartTouchInteractionMove,
             'onChartTouchInteractionUp': onChartTouchInteractionUp,
             'onCrosshairPositionChanging': onCrosshairPositionChanging,
             'onDataLabelRender': onDataLabelRender,
             'onDataLabelTapped': onDataLabelTapped,
             'onLegendItemRender': onLegendItemRender,
             'onLegendTapped': onLegendTapped,
             'onMarkerRender': onMarkerRender,
             'onPlotAreaSwipe': onPlotAreaSwipe,
             'onSelectionChanged': onSelectionChanged,
             'onTooltipRender': onTooltipRender,
             'onTrackballPositionChanging': onTrackballPositionChanging,
             'onZoomEnd': onZoomEnd,
             'onZoomReset': onZoomReset,
             'onZoomStart': onZoomStart,
             'onZooming': onZooming,
             'palette': palette,
             'plotAreaBackgroundColor': plotAreaBackgroundColor,
             'plotAreaBackgroundImage': plotAreaBackgroundImage,
             'plotAreaBorderColor': plotAreaBorderColor,
             'plotAreaBorderWidth': plotAreaBorderWidth,
             'primaryXAxis': primaryXAxis,
             'primaryYAxis': primaryYAxis,
             'selectionGesture': selectionGesture,
             'selectionType': selectionType,
             'series': series,
             'title': title,
             'tooltipBehavior': tooltipBehavior,
             'trackballBehavior': trackballBehavior,
             'zoomPanBehavior': zoomPanBehavior,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => SfCartesianChartBuilder(
           args: SfCartesianChartBuilderModel.fromDynamic(
             {
               'annotations': annotations,
               'axes': axes,
               'backgroundColor': backgroundColor,
               'borderColor': borderColor,
               'borderWidth': borderWidth,
               'crosshairBehavior': crosshairBehavior,
               'enableAxisAnimation': enableAxisAnimation,
               'enableMultiSelection': enableMultiSelection,
               'enableSideBySideSeriesPlacement':
                   enableSideBySideSeriesPlacement,
               'indicators': indicators,
               'isTransposed': isTransposed,
               'legend': legend,
               'loadMoreIndicatorBuilder': loadMoreIndicatorBuilder,
               'margin': margin,
               'onActualRangeChanged': onActualRangeChanged,
               'onAxisLabelTapped': onAxisLabelTapped,
               'onChartTouchInteractionDown': onChartTouchInteractionDown,
               'onChartTouchInteractionMove': onChartTouchInteractionMove,
               'onChartTouchInteractionUp': onChartTouchInteractionUp,
               'onCrosshairPositionChanging': onCrosshairPositionChanging,
               'onDataLabelRender': onDataLabelRender,
               'onDataLabelTapped': onDataLabelTapped,
               'onLegendItemRender': onLegendItemRender,
               'onLegendTapped': onLegendTapped,
               'onMarkerRender': onMarkerRender,
               'onPlotAreaSwipe': onPlotAreaSwipe,
               'onSelectionChanged': onSelectionChanged,
               'onTooltipRender': onTooltipRender,
               'onTrackballPositionChanging': onTrackballPositionChanging,
               'onZoomEnd': onZoomEnd,
               'onZoomReset': onZoomReset,
               'onZoomStart': onZoomStart,
               'onZooming': onZooming,
               'palette': palette,
               'plotAreaBackgroundColor': plotAreaBackgroundColor,
               'plotAreaBackgroundImage': plotAreaBackgroundImage,
               'plotAreaBorderColor': plotAreaBorderColor,
               'plotAreaBorderWidth': plotAreaBorderWidth,
               'primaryXAxis': primaryXAxis,
               'primaryYAxis': primaryYAxis,
               'selectionGesture': selectionGesture,
               'selectionType': selectionType,
               'series': series,
               'title': title,
               'tooltipBehavior': tooltipBehavior,
               'trackballBehavior': trackballBehavior,
               'zoomPanBehavior': zoomPanBehavior,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: SfCartesianChartBuilder.kType,
       );

  /* AUTOGENERATED FROM [SfCartesianChart.annotations]*/
  /// Customizes the annotations. Annotations are used to mark the specific area
  /// of interest in the plot area with texts, shapes, or images.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            annotations: <CartesianChartAnnotation>[
  ///                CartesianChartAnnotation(
  ///                    widget: Container(
  ///                    child: const Text('Annotation')),
  ///                    coordinateUnit: CoordinateUnit.point,
  ///                    region: AnnotationRegion.chart,
  ///                    x: 3,
  ///                    y: 60
  ///                 ),
  ///             ],
  ///          )
  ///     );
  /// }
  /// ```
  final List<CartesianChartAnnotation>? annotations;

  /* AUTOGENERATED FROM [SfCartesianChart.axes]*/
  /// Customizes the additional axes in the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  /// return Container(
  ///   child: SfCartesianChart(axes: <ChartAxis>[
  ///     NumericAxis(majorGridLines: MajorGridLines(color: Colors.transparent))
  ///  ]));
  /// }
  /// ```
  final List<ChartAxis> axes;

  /* AUTOGENERATED FROM [SfCartesianChart.backgroundColor]*/
  /// Background color of the chart.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            backgroundColor: Colors.blue
  ///        )
  ///    );
  /// }
  /// ```
  final Color? backgroundColor;

  /* AUTOGENERATED FROM [SfCartesianChart.borderColor]*/
  /// Color of the chart border.
  ///
  /// Defaults to `Colors.transparent`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            borderColor: Colors.red
  ///        )
  ///   );
  /// }
  /// ```
  final Color borderColor;

  /* AUTOGENERATED FROM [SfCartesianChart.borderWidth]*/
  /// Width of the chart border.
  ///
  /// Defaults to `0`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            borderWidth: 2
  ///        )
  ///     );
  /// }
  /// ```
  final double borderWidth;

  /* AUTOGENERATED FROM [SfCartesianChart.crosshairBehavior]*/
  /// Customizes the crosshair in chart.
  ///
  /// ```dart
  /// late CrosshairBehavior _crosshairBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _crosshairBehavior = CrosshairBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  ///  Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             crosshairBehavior: _crosshairBehavior,
  ///          )
  ///      );
  /// }
  /// ```
  final CrosshairBehavior? crosshairBehavior;

  /* AUTOGENERATED FROM [SfCartesianChart.enableAxisAnimation]*/
  /// Axis elements animation on visible range change.
  ///
  /// Axis elements like grid lines, tick lines and labels will be animated when
  /// the axis range is changed dynamically. Axis visible range will be changed
  /// while zooming, panning or while updating the data points.
  ///
  /// The elements will be animated on setting `true` to this property and this
  /// is applicable for all primary and secondary axis in the chart.
  ///
  /// Defaults to `false`.
  ///
  /// See also [ChartSeries.animationDuration] for changing the series
  /// animation duration.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             enableAxisAnimation: true,
  ///           )
  ///      );
  /// }
  /// ```
  final bool enableAxisAnimation;

  /* AUTOGENERATED FROM [SfCartesianChart.enableMultiSelection]*/
  /// Enables or disables the multiple data points or series selection.
  ///
  /// Defaults to `false`.
  ///
  /// ```dart
  /// late SelectionBehavior _selectionBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _selectionBehavior = SelectionBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             enableMultiSelection: true,
  ///             series: <BarSeries<SalesData, num>>[
  ///                 BarSeries<SalesData, num>(
  ///                   selectionBehavior: _selectionBehavior
  ///                 ),
  ///               ],
  ///           )
  ///      );
  /// }
  /// ```
  final bool enableMultiSelection;

  /* AUTOGENERATED FROM [SfCartesianChart.enableSideBySideSeriesPlacement]*/
  /// Enables or disables the placing of series side by side.
  ///
  /// Defaults to `true`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           enableSideBySideSeriesPlacement: false
  ///        )
  ///    );
  /// }
  /// ```
  final bool enableSideBySideSeriesPlacement;

  /* AUTOGENERATED FROM [SfCartesianChart.indicators]*/
  /// Technical indicators for charts.
  final List<TechnicalIndicator<dynamic, dynamic>> indicators;

  /* AUTOGENERATED FROM [SfCartesianChart.isTransposed]*/
  /// By setting this, the orientation of x-axis is set to vertical and
  /// orientation of y-axis is set to horizontal.
  ///
  /// Defaults to `false`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             isTransposed: true,
  ///           )
  ///      );
  /// }
  /// ```
  final bool isTransposed;

  /* AUTOGENERATED FROM [SfCartesianChart.legend]*/
  /// Customizes the legend in the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            legend: Legend(isVisible: true),
  ///        )
  ///    );
  /// }
  /// ```
  final Legend legend;

  /* AUTOGENERATED FROM [SfCartesianChart.loadMoreIndicatorBuilder]*/
  /// A builder that builds the widget (ex., loading indicator or load more
  /// button) to display at the top of the chart area when horizontal scrolling
  /// reaches the start or end of the chart.
  ///
  /// This can be used to achieve the features like load more and infinite
  /// scrolling in the chart. Also provides the swiping direction value
  /// to the user.
  ///
  /// If the chart is transposed, this will be called when the vertical
  /// scrolling reaches the top or bottom of the chart.
  ///
  /// ## Infinite scrolling
  ///
  /// The below example demonstrates the infinite scrolling by showing
  /// the circular progress indicator until the data is loaded when horizontal
  /// scrolling reaches the end of the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           loadMoreIndicatorBuilder:
  ///             (BuildContext context, ChartSwipeDirection direction) =>
  ///                 getLoadMoreViewBuilder(context, direction),
  ///           series: <CartesianSeries<SalesData, num>>[
  ///                AreaSeries<SalesData, num>(
  ///                    dataSource: chartData,
  ///                ),
  ///              ],
  ///          )
  ///     );
  /// }
  /// Widget getLoadMoreViewBuilder(
  ///      BuildContext context, ChartSwipeDirection direction) {
  ///     if (direction == ChartSwipeDirection.end) {
  ///       return FutureBuilder<String>(
  ///         future: _updateData(), /// Adding data by updateDataSource method
  ///         builder:
  ///          (BuildContext futureContext, AsyncSnapshot<String> snapShot) {
  ///           return snapShot.connectionState != ConnectionState.done
  ///               ? const CircularProgressIndicator()
  ///               : SizedBox.fromSize(size: Size.zero);
  ///         },
  ///     );
  ///     } else {
  ///       return SizedBox.fromSize(size: Size.zero);
  ///     }
  /// }
  /// ```
  ///
  /// ## Load more
  ///
  /// The below example demonstrates how to show a button when horizontal
  /// scrolling reaches the end of the chart.
  /// On tapping the button circular indicator will be displayed and data will
  /// be loaded to the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           loadMoreIndicatorBuilder:
  ///             (BuildContext context, ChartSwipeDirection direction) =>
  ///                 _buildLoadMoreView(context, direction),
  ///           series: <CartesianSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                    dataSource: chartData,
  ///                ),
  ///              ],
  ///         )
  ///     );
  /// }
  /// Widget _buildLoadMoreView(
  ///       BuildContext context, ChartSwipeDirection direction) {
  ///     _visible = true;
  /// if (direction == ChartSwipeDirection.end) {
  ///     return StatefulBuilder(
  ///         builder: (BuildContext context, StateSetter stateSetter) {
  ///       return Visibility(
  ///         visible: _visible,
  ///         child: RaisedButton(
  ///             child: const Text('Load More'),
  ///             onPressed: () async{
  ///               stateSetter(() {
  ///                   _visible = false;
  ///               });
  ///               await loadMore();
  ///             }),
  ///       );
  ///     });
  ///  } else {
  ///     return null;
  ///  }
  /// }
  /// FutureBuilder<String> loadMore() {
  ///       return FutureBuilder<String>(
  ///         future: _updateData(), /// Adding data by updateDataSource method
  ///         builder:
  ///          (BuildContext futureContext, AsyncSnapshot<String> snapShot) {
  ///           return snapShot.connectionState != ConnectionState.done
  ///               ? const CircularProgressIndicator()
  ///               : SizedBox.fromSize(size: Size.zero);
  ///         },
  ///     );
  /// }
  /// ```
  final Widget Function(BuildContext, ChartSwipeDirection)?
  loadMoreIndicatorBuilder;

  /* AUTOGENERATED FROM [SfCartesianChart.margin]*/
  /// Margin for chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            margin: const EdgeInsets.all(2),
  ///            borderColor: Colors.blue
  ///        )
  ///    );
  /// }
  /// ```
  final EdgeInsets margin;

  /* AUTOGENERATED FROM [SfCartesianChart.onActualRangeChanged]*/
  /// Occurs when the visible range of an axis is changed, i.e. value changes
  /// for minimum, maximum, and interval. Here, you can get the actual and
  /// visible range of an axis.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///         onActualRangeChanged: (ActualRangeChangedArgs args) => range(args)
  ///        )
  ///    );
  /// }
  ///
  /// void range(ActualRangeChangedArgs args) {
  ///   print(args.visibleMin);
  /// }
  /// ```
  final void Function(ActualRangeChangedArgs)? onActualRangeChanged;

  /* AUTOGENERATED FROM [SfCartesianChart.onAxisLabelTapped]*/
  /// Occurs when tapping the axis label. Here, you can get the appropriate
  /// axis that is tapped and the axis label text.
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onAxisLabelTapped: (AxisLabelTapArgs args) => axis(args),
  ///        )
  ///    );
  /// }
  ///
  /// void axis(AxisLabelTapArgs args) {
  ///   print(args.text);
  /// }
  /// ```
  final void Function(AxisLabelTapArgs)? onAxisLabelTapped;

  /* AUTOGENERATED FROM [SfCartesianChart.onChartTouchInteractionDown]*/
  /// Occurs when touched on the chart area.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onChartTouchInteractionDown: (ChartTouchInteractionArgs args){
  ///               print(args.position.dx.toString());
  ///               print(args.position.dy.toString());
  ///             }
  ///        )
  ///    );
  /// }
  /// ```
  final void Function(ChartTouchInteractionArgs)? onChartTouchInteractionDown;

  /* AUTOGENERATED FROM [SfCartesianChart.onChartTouchInteractionMove]*/
  /// Occurs when touched and moved on the chart area.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onChartTouchInteractionMove: (ChartTouchInteractionArgs args){
  ///               print(args.position.dx.toString());
  ///               print(args.position.dy.toString());
  ///             }
  ///        )
  ///     );
  /// }
  /// ```
  final void Function(ChartTouchInteractionArgs)? onChartTouchInteractionMove;

  /* AUTOGENERATED FROM [SfCartesianChart.onChartTouchInteractionUp]*/
  /// Occurs when tapped on the chart area.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onChartTouchInteractionUp: (ChartTouchInteractionArgs args){
  ///               print(args.position.dx.toString());
  ///               print(args.position.dy.toString());
  ///             }
  ///        )
  ///    );
  /// }
  /// ```
  final void Function(ChartTouchInteractionArgs)? onChartTouchInteractionUp;

  /* AUTOGENERATED FROM [SfCartesianChart.onCrosshairPositionChanging]*/
  /// Occurs when tapping the axis label. Here, you can get the appropriate axis
  /// that is tapped and the axis label text.
  ///
  /// ```dart
  /// late CrosshairBehavior _crosshairBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _crosshairBehavior = CrosshairBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             crosshairBehavior: _crosshairBehavior,
  /// onCrosshairPositionChanging: (CrosshairRenderArgs args) => crosshair(args)
  ///         )
  ///     );
  /// }
  /// void crosshair(CrosshairRenderArgs args) {
  ///     args.text = 'crosshair';
  /// }
  /// ```
  final void Function(CrosshairRenderArgs)? onCrosshairPositionChanging;

  /* AUTOGENERATED FROM [SfCartesianChart.onDataLabelRender]*/
  /// Occurs when tapping the axis label. Here, you can get the appropriate axis
  /// that is tapped and the axis label text.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///          onDataLabelRender: (DataLabelRenderArgs args) => dataLabel(args),
  ///          series: <CartesianSeries<ChartData, String>>[
  ///         ColumnSeries<ChartData, String>(
  ///           dataLabelSettings: DataLabelSettings(isVisible: true),
  ///         ),
  ///       ],
  ///     )
  ///   );
  /// }
  ///
  /// void dataLabel(DataLabelRenderArgs args) {
  ///   args.text = 'data Label';
  /// }
  /// ```
  final void Function(DataLabelRenderArgs)? onDataLabelRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onDataLabelTapped]*/
  /// Called when the data label is tapped.
  ///
  /// Whenever the data label is tapped, `onDataLabelTapped` callback will be
  /// called. Provides options to get the position of the data label, series
  /// index, point index and its text.
  ///
  /// _Note:_  This callback will not be called, when the builder is specified
  /// for data label (data label template). For this case, custom widget
  /// specified in the `DataLabelSettings.builder` property can be wrapped
  /// using the `GestureDetector` and this functionality can be achieved
  /// in the application level.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onDataLabelTapped: (DataLabelTapDetails args) {
  ///                 print(arg.seriesIndex);
  ///                  }
  ///        )
  ///    );
  /// }
  /// ```
  final void Function(DataLabelTapDetails)? onDataLabelTapped;

  /* AUTOGENERATED FROM [SfCartesianChart.onLegendItemRender]*/
  /// Occurs when the legend item is rendered. Here, you can get the legend’s
  /// text, shape, series index, and point index of circular series.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            legend: Legend(isVisible: true),
  ///            onLegendItemRender: (LegendRenderArgs args) => legend(args)
  ///        )
  ///    );
  /// }
  /// void legend(LegendRenderArgs args) {
  ///   args.seriesIndex = 2;
  /// }
  /// ```
  final void Function(LegendRenderArgs)? onLegendItemRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onLegendTapped]*/
  /// Occurs when the legend item is rendered. Here, you can get the legend’s
  /// text, shape, series index, and point index of circular series.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onLegendTapped: (LegendTapArgs args) => legend(args),
  ///        )
  ///    );
  /// }
  ///
  /// void legend(LegendTapArgs args) {
  ///   print(args.pointIndex);
  /// }
  /// ```
  final void Function(LegendTapArgs)? onLegendTapped;

  /* AUTOGENERATED FROM [SfCartesianChart.onMarkerRender]*/
  /// Occurs when the marker is rendered. Here, you can get the marker
  /// pointIndex shape, height and width of data markers.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Container(child: SfCartesianChart(
  ///    onMarkerRender: (MarkerRenderArgs args) {
  ///      if (args.pointIndex == 2) {
  ///        args.markerHeight = 20.0;
  ///        args.markerWidth = 20.0;
  ///        args.shape = DataMarkerType.triangle;
  ///      }
  ///    },
  ///  ));
  /// }
  /// ```
  final void Function(MarkerRenderArgs)? onMarkerRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onPlotAreaSwipe]*/
  /// Called while swiping on the plot area.
  ///
  /// Whenever the swiping happens on the plot area (the series rendering area),
  /// `onPlotAreaSwipe` callback will be called. It provides options to get the
  /// direction of swiping.
  ///
  /// If the chart is swiped from left to right direction, the direction is
  /// `ChartSwipeDirection.start` and if the swipe happens from right to left
  /// direction, the direction is `ChartSwipeDirection.end`.
  ///
  /// Using this callback, the user able to achieve pagination functionality
  /// (on swiping over chart area, next set of data points can be
  /// loaded to the chart).
  ///
  /// Also refer [ChartSwipeDirection].
  ///
  /// ```dart
  /// ChartSeriesController? seriesController;
  ///
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           onPlotAreaSwipe:
  ///             (ChartSwipeDirection direction) =>
  ///                 performSwipe(direction),
  ///           series: <CartesianSeries<SalesData, num>>[
  ///                AreaSeries<SalesData, num>(
  ///                    dataSource: chartData,
  ///                ),
  ///              ],
  ///          )
  ///     );
  /// }
  /// Widget performSwipe(ChartSwipeDirection direction) {
  ///     if (direction == ChartSwipeDirection.end) {
  ///         chartData.add(ChartSampleData(
  ///             x: chartData[chartData.length - 1].x + 1,
  ///             y: 10));
  ///   seriesController.updateDataSource(addedDataIndex: chartData.length - 1);
  ///     }
  /// }
  /// ```
  final void Function(ChartSwipeDirection)? onPlotAreaSwipe;

  /* AUTOGENERATED FROM [SfCartesianChart.onSelectionChanged]*/
  /// Occurs while selection changes. Here, you can get the series,
  /// selected color, unselected color, selected border color,
  /// unselected border color, selected border width, unselected border width,
  /// series index, and point index.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///     onSelectionChanged: (SelectionArgs args) => print(args.selectedColor),
  ///        )
  ///    );
  /// }
  final void Function(SelectionArgs)? onSelectionChanged;

  /* AUTOGENERATED FROM [SfCartesianChart.onTooltipRender]*/
  /// Occurs while tooltip is rendered. You can customize the position
  /// and header. Here, you can get the text, header, point index, series,
  /// x and y-positions.
  ///
  /// ```dart
  /// TooltipBehavior _tooltipBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _tooltipBehavior = TooltipBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             tooltipBehavior: _tooltipBehavior,
  ///             onTooltipRender: (TooltipArgs args) => tool(args)
  ///         )
  ///     );
  /// }
  ///
  /// void tool(TooltipArgs args) {
  ///    args.locationX = 30;
  /// }
  /// ```
  final void Function(TooltipArgs)? onTooltipRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onTrackballPositionChanging]*/
  /// Occurs while the trackball position is changed. Here, you can customize
  /// the text of the trackball.
  ///
  /// ```dart
  /// late TrackballBehavior _trackballBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _trackballBehavior = TrackballBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             trackballBehavior: _trackballBehavior,
  ///       onTrackballPositionChanging: (TrackballArgs args) => trackball(args)
  ///         )
  ///     );
  /// }
  /// void trackball(TrackballArgs args) {
  ///     args.chartPointInfo = ChartPointInfo();
  /// }
  /// ```
  final void Function(TrackballArgs)? onTrackballPositionChanging;

  /* AUTOGENERATED FROM [SfCartesianChart.onZoomEnd]*/
  /// Occurs when the zooming action is completed. Here, you can get the axis,
  /// current zoom factor, current zoom position, previous zoom factor, and
  /// previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZoomEnd: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     print(args.currentZoomPosition);
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZoomEnd;

  /* AUTOGENERATED FROM [SfCartesianChart.onZoomReset]*/
  /// Occurs when zoomed state is reset. Here, you can get the axis,
  /// current zoom factor, current zoom position, previous zoom factor,
  /// and previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZoomReset: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     print(args.currentZoomPosition);
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZoomReset;

  /* AUTOGENERATED FROM [SfCartesianChart.onZoomStart]*/
  /// Occurs when zooming action begins. You can customize the zoom factor and
  /// zoom position of an axis. Here, you can get the axis, current zoom factor,
  /// current zoom position, previous zoom factor, and previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZoomStart: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     args.currentZoomFactor = 0.2;
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZoomStart;

  /* AUTOGENERATED FROM [SfCartesianChart.onZooming]*/
  /// Occurs when Zooming event is performed. Here, you can get the axis,
  /// current zoom factor, current zoom position, previous zoom factor,
  /// and previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZooming: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     print(args.currentZoomPosition);
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZooming;

  /* AUTOGENERATED FROM [SfCartesianChart.palette]*/
  /// Color palette for chart series. If the series color is not specified,
  /// then the series will be rendered with appropriate palette color.
  /// Ten colors are available by default.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             palette: <Color>[Colors.red, Colors.green]
  ///           )
  ///      );
  /// }
  /// ```
  final List<Color>? palette;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBackgroundColor]*/
  /// Background color of the plot area.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            plotAreaBackgroundColor: Colors.red,
  ///        )
  ///    );
  /// }
  /// ```
  final Color? plotAreaBackgroundColor;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBackgroundImage]*/
  /// Background image for chart.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             plotAreaBackgroundImage: const AssetImage('images/bike.png'),
  ///          )
  ///      );
  /// }
  /// ```
  final ImageProvider<Object>? plotAreaBackgroundImage;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBorderColor]*/
  /// Border color of the plot area.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            plotAreaBorderColor: Colors.red,
  ///        )
  ///    );
  /// }
  /// ```
  final Color? plotAreaBorderColor;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBorderWidth]*/
  /// Border width of the plot area.
  ///
  /// Defaults to `0.7`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            plotAreaBorderColor: Colors.red,
  ///            plotAreaBorderWidth: 2
  ///        )
  ///    );
  /// }
  /// ```
  final double plotAreaBorderWidth;

  /* AUTOGENERATED FROM [SfCartesianChart.primaryXAxis]*/
  /// Customizes the primary x-axis in chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            primaryXAxis: DateTimeAxis(interval: 1)
  ///        )
  ///    );
  /// }
  /// ```
  final ChartAxis primaryXAxis;

  /* AUTOGENERATED FROM [SfCartesianChart.primaryYAxis]*/
  /// Customizes the primary y-axis in chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            primaryYAxis: NumericAxis(isInversed: false)
  ///        )
  ///    );
  /// }
  /// ```
  final ChartAxis primaryYAxis;

  /* AUTOGENERATED FROM [SfCartesianChart.selectionGesture]*/
  /// Gesture for activating the selection. Selection can be activated in tap,
  /// double tap, and long press.
  ///
  /// Defaults to `ActivationMode.tap`.
  ///
  /// Also refer [ActivationMode].
  ///
  /// ```dart
  /// late SelectionBehavior _selectionBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _selectionBehavior = SelectionBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             selectionGesture: ActivationMode.doubleTap,
  ///             series: <BarSeries<SalesData, num>>[
  ///                 BarSeries<SalesData, num>(
  ///                   selectionBehavior: _selectionBehavior
  ///                 ),
  ///               ],
  ///           )
  ///      );
  /// }
  /// ```
  final ActivationMode selectionGesture;

  /* AUTOGENERATED FROM [SfCartesianChart.selectionType]*/
  /// Mode of selecting the data points or series.
  ///
  /// Defaults to `SelectionType.point`.
  ///
  /// Also refer [SelectionType].
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            selectionType: SelectionType.series,
  ///         )
  ///     );
  /// }
  /// ```
  final SelectionType selectionType;

  /* AUTOGENERATED FROM [SfCartesianChart.series]*/
  /// Customizes the series in chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///            series: <CartesianSeries<SalesData, num>>[
  ///                 AreaSeries<SalesData, num>(
  ///                     dataSource: chartData,
  ///                 ),
  ///               ],
  ///           )
  ///      );
  /// }
  /// ```
  final List<CartesianSeries<dynamic, dynamic>> series;

  /* AUTOGENERATED FROM [SfCartesianChart.title]*/
  /// Customizes the chart title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            title: ChartTitle(
  ///                    text: 'Area with animation',
  ///                    alignment: ChartAlignment.center,
  ///                    backgroundColor: Colors.white,
  ///                    borderColor: Colors.transparent,
  ///                    borderWidth: 0)
  ///        )
  ///    );
  /// }
  /// ```
  final ChartTitle title;

  /* AUTOGENERATED FROM [SfCartesianChart.tooltipBehavior]*/
  /// Customizes the tooltip in chart.
  ///
  /// ```dart
  /// late TooltipBehavior _tooltipBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _tooltipBehavior = TooltipBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             tooltipBehavior: _tooltipBehavior
  ///           )
  ///      );
  /// }
  /// ```
  final TooltipBehavior? tooltipBehavior;

  /* AUTOGENERATED FROM [SfCartesianChart.trackballBehavior]*/
  /// Customizes the trackball in chart.
  ///
  /// ```dart
  /// late TrackballBehavior _trackballBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _trackballBehavior = TrackballBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             trackballBehavior: _trackballBehavior,
  ///           )
  ///      );
  /// }
  /// ```
  final TrackballBehavior? trackballBehavior;

  /* AUTOGENERATED FROM [SfCartesianChart.zoomPanBehavior]*/
  /// Customizes the zooming and panning settings.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior( enablePanning: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior
  ///           )
  ///      );
  /// }
  /// ```
  final ZoomPanBehavior? zoomPanBehavior;
}

/* AUTOGENERATED FROM [SfCartesianChart]*/
/// Creating an argument constructor of [SfCartesianChart] class.
class SfCartesianChartBuilderModel extends JsonWidgetBuilderModel {
  const SfCartesianChartBuilderModel(
    super.args, {
    this.annotations,
    this.axes = const <ChartAxis>[],
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.crosshairBehavior,
    this.enableAxisAnimation = false,
    this.enableMultiSelection = false,
    this.enableSideBySideSeriesPlacement = true,
    this.indicators = const <TechnicalIndicator>[],
    this.isTransposed = false,
    this.legend = const Legend(),
    this.loadMoreIndicatorBuilder,
    this.margin = const EdgeInsets.all(10),
    this.onActualRangeChanged,
    this.onAxisLabelTapped,
    this.onChartTouchInteractionDown,
    this.onChartTouchInteractionMove,
    this.onChartTouchInteractionUp,
    this.onCrosshairPositionChanging,
    this.onDataLabelRender,
    this.onDataLabelTapped,
    this.onLegendItemRender,
    this.onLegendTapped,
    this.onMarkerRender,
    this.onPlotAreaSwipe,
    this.onSelectionChanged,
    this.onTooltipRender,
    this.onTrackballPositionChanging,
    this.onZoomEnd,
    this.onZoomReset,
    this.onZoomStart,
    this.onZooming,
    this.palette,
    this.plotAreaBackgroundColor,
    this.plotAreaBackgroundImage,
    this.plotAreaBorderColor,
    this.plotAreaBorderWidth = 0.7,
    this.primaryXAxis = const NumericAxis(),
    this.primaryYAxis = const NumericAxis(),
    this.selectionGesture = ActivationMode.singleTap,
    this.selectionType = SelectionType.point,
    this.series = const <CartesianSeries>[],
    this.title = const ChartTitle(),
    this.tooltipBehavior,
    this.trackballBehavior,
    this.zoomPanBehavior,
  });

  /* AUTOGENERATED FROM [SfCartesianChart.annotations]*/
  /// Customizes the annotations. Annotations are used to mark the specific area
  /// of interest in the plot area with texts, shapes, or images.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            annotations: <CartesianChartAnnotation>[
  ///                CartesianChartAnnotation(
  ///                    widget: Container(
  ///                    child: const Text('Annotation')),
  ///                    coordinateUnit: CoordinateUnit.point,
  ///                    region: AnnotationRegion.chart,
  ///                    x: 3,
  ///                    y: 60
  ///                 ),
  ///             ],
  ///          )
  ///     );
  /// }
  /// ```
  final List<CartesianChartAnnotation>? annotations;

  /* AUTOGENERATED FROM [SfCartesianChart.axes]*/
  /// Customizes the additional axes in the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  /// return Container(
  ///   child: SfCartesianChart(axes: <ChartAxis>[
  ///     NumericAxis(majorGridLines: MajorGridLines(color: Colors.transparent))
  ///  ]));
  /// }
  /// ```
  final List<ChartAxis> axes;

  /* AUTOGENERATED FROM [SfCartesianChart.backgroundColor]*/
  /// Background color of the chart.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            backgroundColor: Colors.blue
  ///        )
  ///    );
  /// }
  /// ```
  final Color? backgroundColor;

  /* AUTOGENERATED FROM [SfCartesianChart.borderColor]*/
  /// Color of the chart border.
  ///
  /// Defaults to `Colors.transparent`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            borderColor: Colors.red
  ///        )
  ///   );
  /// }
  /// ```
  final Color borderColor;

  /* AUTOGENERATED FROM [SfCartesianChart.borderWidth]*/
  /// Width of the chart border.
  ///
  /// Defaults to `0`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            borderWidth: 2
  ///        )
  ///     );
  /// }
  /// ```
  final double borderWidth;

  /* AUTOGENERATED FROM [SfCartesianChart.crosshairBehavior]*/
  /// Customizes the crosshair in chart.
  ///
  /// ```dart
  /// late CrosshairBehavior _crosshairBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _crosshairBehavior = CrosshairBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  ///  Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             crosshairBehavior: _crosshairBehavior,
  ///          )
  ///      );
  /// }
  /// ```
  final CrosshairBehavior? crosshairBehavior;

  /* AUTOGENERATED FROM [SfCartesianChart.enableAxisAnimation]*/
  /// Axis elements animation on visible range change.
  ///
  /// Axis elements like grid lines, tick lines and labels will be animated when
  /// the axis range is changed dynamically. Axis visible range will be changed
  /// while zooming, panning or while updating the data points.
  ///
  /// The elements will be animated on setting `true` to this property and this
  /// is applicable for all primary and secondary axis in the chart.
  ///
  /// Defaults to `false`.
  ///
  /// See also [ChartSeries.animationDuration] for changing the series
  /// animation duration.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             enableAxisAnimation: true,
  ///           )
  ///      );
  /// }
  /// ```
  final bool enableAxisAnimation;

  /* AUTOGENERATED FROM [SfCartesianChart.enableMultiSelection]*/
  /// Enables or disables the multiple data points or series selection.
  ///
  /// Defaults to `false`.
  ///
  /// ```dart
  /// late SelectionBehavior _selectionBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _selectionBehavior = SelectionBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             enableMultiSelection: true,
  ///             series: <BarSeries<SalesData, num>>[
  ///                 BarSeries<SalesData, num>(
  ///                   selectionBehavior: _selectionBehavior
  ///                 ),
  ///               ],
  ///           )
  ///      );
  /// }
  /// ```
  final bool enableMultiSelection;

  /* AUTOGENERATED FROM [SfCartesianChart.enableSideBySideSeriesPlacement]*/
  /// Enables or disables the placing of series side by side.
  ///
  /// Defaults to `true`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           enableSideBySideSeriesPlacement: false
  ///        )
  ///    );
  /// }
  /// ```
  final bool enableSideBySideSeriesPlacement;

  /* AUTOGENERATED FROM [SfCartesianChart.indicators]*/
  /// Technical indicators for charts.
  final List<TechnicalIndicator<dynamic, dynamic>> indicators;

  /* AUTOGENERATED FROM [SfCartesianChart.isTransposed]*/
  /// By setting this, the orientation of x-axis is set to vertical and
  /// orientation of y-axis is set to horizontal.
  ///
  /// Defaults to `false`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             isTransposed: true,
  ///           )
  ///      );
  /// }
  /// ```
  final bool isTransposed;

  /* AUTOGENERATED FROM [SfCartesianChart.legend]*/
  /// Customizes the legend in the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            legend: Legend(isVisible: true),
  ///        )
  ///    );
  /// }
  /// ```
  final Legend legend;

  /* AUTOGENERATED FROM [SfCartesianChart.loadMoreIndicatorBuilder]*/
  /// A builder that builds the widget (ex., loading indicator or load more
  /// button) to display at the top of the chart area when horizontal scrolling
  /// reaches the start or end of the chart.
  ///
  /// This can be used to achieve the features like load more and infinite
  /// scrolling in the chart. Also provides the swiping direction value
  /// to the user.
  ///
  /// If the chart is transposed, this will be called when the vertical
  /// scrolling reaches the top or bottom of the chart.
  ///
  /// ## Infinite scrolling
  ///
  /// The below example demonstrates the infinite scrolling by showing
  /// the circular progress indicator until the data is loaded when horizontal
  /// scrolling reaches the end of the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           loadMoreIndicatorBuilder:
  ///             (BuildContext context, ChartSwipeDirection direction) =>
  ///                 getLoadMoreViewBuilder(context, direction),
  ///           series: <CartesianSeries<SalesData, num>>[
  ///                AreaSeries<SalesData, num>(
  ///                    dataSource: chartData,
  ///                ),
  ///              ],
  ///          )
  ///     );
  /// }
  /// Widget getLoadMoreViewBuilder(
  ///      BuildContext context, ChartSwipeDirection direction) {
  ///     if (direction == ChartSwipeDirection.end) {
  ///       return FutureBuilder<String>(
  ///         future: _updateData(), /// Adding data by updateDataSource method
  ///         builder:
  ///          (BuildContext futureContext, AsyncSnapshot<String> snapShot) {
  ///           return snapShot.connectionState != ConnectionState.done
  ///               ? const CircularProgressIndicator()
  ///               : SizedBox.fromSize(size: Size.zero);
  ///         },
  ///     );
  ///     } else {
  ///       return SizedBox.fromSize(size: Size.zero);
  ///     }
  /// }
  /// ```
  ///
  /// ## Load more
  ///
  /// The below example demonstrates how to show a button when horizontal
  /// scrolling reaches the end of the chart.
  /// On tapping the button circular indicator will be displayed and data will
  /// be loaded to the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           loadMoreIndicatorBuilder:
  ///             (BuildContext context, ChartSwipeDirection direction) =>
  ///                 _buildLoadMoreView(context, direction),
  ///           series: <CartesianSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                    dataSource: chartData,
  ///                ),
  ///              ],
  ///         )
  ///     );
  /// }
  /// Widget _buildLoadMoreView(
  ///       BuildContext context, ChartSwipeDirection direction) {
  ///     _visible = true;
  /// if (direction == ChartSwipeDirection.end) {
  ///     return StatefulBuilder(
  ///         builder: (BuildContext context, StateSetter stateSetter) {
  ///       return Visibility(
  ///         visible: _visible,
  ///         child: RaisedButton(
  ///             child: const Text('Load More'),
  ///             onPressed: () async{
  ///               stateSetter(() {
  ///                   _visible = false;
  ///               });
  ///               await loadMore();
  ///             }),
  ///       );
  ///     });
  ///  } else {
  ///     return null;
  ///  }
  /// }
  /// FutureBuilder<String> loadMore() {
  ///       return FutureBuilder<String>(
  ///         future: _updateData(), /// Adding data by updateDataSource method
  ///         builder:
  ///          (BuildContext futureContext, AsyncSnapshot<String> snapShot) {
  ///           return snapShot.connectionState != ConnectionState.done
  ///               ? const CircularProgressIndicator()
  ///               : SizedBox.fromSize(size: Size.zero);
  ///         },
  ///     );
  /// }
  /// ```
  final Widget Function(BuildContext, ChartSwipeDirection)?
  loadMoreIndicatorBuilder;

  /* AUTOGENERATED FROM [SfCartesianChart.margin]*/
  /// Margin for chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            margin: const EdgeInsets.all(2),
  ///            borderColor: Colors.blue
  ///        )
  ///    );
  /// }
  /// ```
  final EdgeInsets margin;

  /* AUTOGENERATED FROM [SfCartesianChart.onActualRangeChanged]*/
  /// Occurs when the visible range of an axis is changed, i.e. value changes
  /// for minimum, maximum, and interval. Here, you can get the actual and
  /// visible range of an axis.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///         onActualRangeChanged: (ActualRangeChangedArgs args) => range(args)
  ///        )
  ///    );
  /// }
  ///
  /// void range(ActualRangeChangedArgs args) {
  ///   print(args.visibleMin);
  /// }
  /// ```
  final void Function(ActualRangeChangedArgs)? onActualRangeChanged;

  /* AUTOGENERATED FROM [SfCartesianChart.onAxisLabelTapped]*/
  /// Occurs when tapping the axis label. Here, you can get the appropriate
  /// axis that is tapped and the axis label text.
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onAxisLabelTapped: (AxisLabelTapArgs args) => axis(args),
  ///        )
  ///    );
  /// }
  ///
  /// void axis(AxisLabelTapArgs args) {
  ///   print(args.text);
  /// }
  /// ```
  final void Function(AxisLabelTapArgs)? onAxisLabelTapped;

  /* AUTOGENERATED FROM [SfCartesianChart.onChartTouchInteractionDown]*/
  /// Occurs when touched on the chart area.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onChartTouchInteractionDown: (ChartTouchInteractionArgs args){
  ///               print(args.position.dx.toString());
  ///               print(args.position.dy.toString());
  ///             }
  ///        )
  ///    );
  /// }
  /// ```
  final void Function(ChartTouchInteractionArgs)? onChartTouchInteractionDown;

  /* AUTOGENERATED FROM [SfCartesianChart.onChartTouchInteractionMove]*/
  /// Occurs when touched and moved on the chart area.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onChartTouchInteractionMove: (ChartTouchInteractionArgs args){
  ///               print(args.position.dx.toString());
  ///               print(args.position.dy.toString());
  ///             }
  ///        )
  ///     );
  /// }
  /// ```
  final void Function(ChartTouchInteractionArgs)? onChartTouchInteractionMove;

  /* AUTOGENERATED FROM [SfCartesianChart.onChartTouchInteractionUp]*/
  /// Occurs when tapped on the chart area.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onChartTouchInteractionUp: (ChartTouchInteractionArgs args){
  ///               print(args.position.dx.toString());
  ///               print(args.position.dy.toString());
  ///             }
  ///        )
  ///    );
  /// }
  /// ```
  final void Function(ChartTouchInteractionArgs)? onChartTouchInteractionUp;

  /* AUTOGENERATED FROM [SfCartesianChart.onCrosshairPositionChanging]*/
  /// Occurs when tapping the axis label. Here, you can get the appropriate axis
  /// that is tapped and the axis label text.
  ///
  /// ```dart
  /// late CrosshairBehavior _crosshairBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _crosshairBehavior = CrosshairBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             crosshairBehavior: _crosshairBehavior,
  /// onCrosshairPositionChanging: (CrosshairRenderArgs args) => crosshair(args)
  ///         )
  ///     );
  /// }
  /// void crosshair(CrosshairRenderArgs args) {
  ///     args.text = 'crosshair';
  /// }
  /// ```
  final void Function(CrosshairRenderArgs)? onCrosshairPositionChanging;

  /* AUTOGENERATED FROM [SfCartesianChart.onDataLabelRender]*/
  /// Occurs when tapping the axis label. Here, you can get the appropriate axis
  /// that is tapped and the axis label text.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///          onDataLabelRender: (DataLabelRenderArgs args) => dataLabel(args),
  ///          series: <CartesianSeries<ChartData, String>>[
  ///         ColumnSeries<ChartData, String>(
  ///           dataLabelSettings: DataLabelSettings(isVisible: true),
  ///         ),
  ///       ],
  ///     )
  ///   );
  /// }
  ///
  /// void dataLabel(DataLabelRenderArgs args) {
  ///   args.text = 'data Label';
  /// }
  /// ```
  final void Function(DataLabelRenderArgs)? onDataLabelRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onDataLabelTapped]*/
  /// Called when the data label is tapped.
  ///
  /// Whenever the data label is tapped, `onDataLabelTapped` callback will be
  /// called. Provides options to get the position of the data label, series
  /// index, point index and its text.
  ///
  /// _Note:_  This callback will not be called, when the builder is specified
  /// for data label (data label template). For this case, custom widget
  /// specified in the `DataLabelSettings.builder` property can be wrapped
  /// using the `GestureDetector` and this functionality can be achieved
  /// in the application level.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onDataLabelTapped: (DataLabelTapDetails args) {
  ///                 print(arg.seriesIndex);
  ///                  }
  ///        )
  ///    );
  /// }
  /// ```
  final void Function(DataLabelTapDetails)? onDataLabelTapped;

  /* AUTOGENERATED FROM [SfCartesianChart.onLegendItemRender]*/
  /// Occurs when the legend item is rendered. Here, you can get the legend’s
  /// text, shape, series index, and point index of circular series.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            legend: Legend(isVisible: true),
  ///            onLegendItemRender: (LegendRenderArgs args) => legend(args)
  ///        )
  ///    );
  /// }
  /// void legend(LegendRenderArgs args) {
  ///   args.seriesIndex = 2;
  /// }
  /// ```
  final void Function(LegendRenderArgs)? onLegendItemRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onLegendTapped]*/
  /// Occurs when the legend item is rendered. Here, you can get the legend’s
  /// text, shape, series index, and point index of circular series.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            onLegendTapped: (LegendTapArgs args) => legend(args),
  ///        )
  ///    );
  /// }
  ///
  /// void legend(LegendTapArgs args) {
  ///   print(args.pointIndex);
  /// }
  /// ```
  final void Function(LegendTapArgs)? onLegendTapped;

  /* AUTOGENERATED FROM [SfCartesianChart.onMarkerRender]*/
  /// Occurs when the marker is rendered. Here, you can get the marker
  /// pointIndex shape, height and width of data markers.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Container(child: SfCartesianChart(
  ///    onMarkerRender: (MarkerRenderArgs args) {
  ///      if (args.pointIndex == 2) {
  ///        args.markerHeight = 20.0;
  ///        args.markerWidth = 20.0;
  ///        args.shape = DataMarkerType.triangle;
  ///      }
  ///    },
  ///  ));
  /// }
  /// ```
  final void Function(MarkerRenderArgs)? onMarkerRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onPlotAreaSwipe]*/
  /// Called while swiping on the plot area.
  ///
  /// Whenever the swiping happens on the plot area (the series rendering area),
  /// `onPlotAreaSwipe` callback will be called. It provides options to get the
  /// direction of swiping.
  ///
  /// If the chart is swiped from left to right direction, the direction is
  /// `ChartSwipeDirection.start` and if the swipe happens from right to left
  /// direction, the direction is `ChartSwipeDirection.end`.
  ///
  /// Using this callback, the user able to achieve pagination functionality
  /// (on swiping over chart area, next set of data points can be
  /// loaded to the chart).
  ///
  /// Also refer [ChartSwipeDirection].
  ///
  /// ```dart
  /// ChartSeriesController? seriesController;
  ///
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           onPlotAreaSwipe:
  ///             (ChartSwipeDirection direction) =>
  ///                 performSwipe(direction),
  ///           series: <CartesianSeries<SalesData, num>>[
  ///                AreaSeries<SalesData, num>(
  ///                    dataSource: chartData,
  ///                ),
  ///              ],
  ///          )
  ///     );
  /// }
  /// Widget performSwipe(ChartSwipeDirection direction) {
  ///     if (direction == ChartSwipeDirection.end) {
  ///         chartData.add(ChartSampleData(
  ///             x: chartData[chartData.length - 1].x + 1,
  ///             y: 10));
  ///   seriesController.updateDataSource(addedDataIndex: chartData.length - 1);
  ///     }
  /// }
  /// ```
  final void Function(ChartSwipeDirection)? onPlotAreaSwipe;

  /* AUTOGENERATED FROM [SfCartesianChart.onSelectionChanged]*/
  /// Occurs while selection changes. Here, you can get the series,
  /// selected color, unselected color, selected border color,
  /// unselected border color, selected border width, unselected border width,
  /// series index, and point index.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///     onSelectionChanged: (SelectionArgs args) => print(args.selectedColor),
  ///        )
  ///    );
  /// }
  final void Function(SelectionArgs)? onSelectionChanged;

  /* AUTOGENERATED FROM [SfCartesianChart.onTooltipRender]*/
  /// Occurs while tooltip is rendered. You can customize the position
  /// and header. Here, you can get the text, header, point index, series,
  /// x and y-positions.
  ///
  /// ```dart
  /// TooltipBehavior _tooltipBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _tooltipBehavior = TooltipBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             tooltipBehavior: _tooltipBehavior,
  ///             onTooltipRender: (TooltipArgs args) => tool(args)
  ///         )
  ///     );
  /// }
  ///
  /// void tool(TooltipArgs args) {
  ///    args.locationX = 30;
  /// }
  /// ```
  final void Function(TooltipArgs)? onTooltipRender;

  /* AUTOGENERATED FROM [SfCartesianChart.onTrackballPositionChanging]*/
  /// Occurs while the trackball position is changed. Here, you can customize
  /// the text of the trackball.
  ///
  /// ```dart
  /// late TrackballBehavior _trackballBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _trackballBehavior = TrackballBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             trackballBehavior: _trackballBehavior,
  ///       onTrackballPositionChanging: (TrackballArgs args) => trackball(args)
  ///         )
  ///     );
  /// }
  /// void trackball(TrackballArgs args) {
  ///     args.chartPointInfo = ChartPointInfo();
  /// }
  /// ```
  final void Function(TrackballArgs)? onTrackballPositionChanging;

  /* AUTOGENERATED FROM [SfCartesianChart.onZoomEnd]*/
  /// Occurs when the zooming action is completed. Here, you can get the axis,
  /// current zoom factor, current zoom position, previous zoom factor, and
  /// previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZoomEnd: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     print(args.currentZoomPosition);
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZoomEnd;

  /* AUTOGENERATED FROM [SfCartesianChart.onZoomReset]*/
  /// Occurs when zoomed state is reset. Here, you can get the axis,
  /// current zoom factor, current zoom position, previous zoom factor,
  /// and previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZoomReset: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     print(args.currentZoomPosition);
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZoomReset;

  /* AUTOGENERATED FROM [SfCartesianChart.onZoomStart]*/
  /// Occurs when zooming action begins. You can customize the zoom factor and
  /// zoom position of an axis. Here, you can get the axis, current zoom factor,
  /// current zoom position, previous zoom factor, and previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZoomStart: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     args.currentZoomFactor = 0.2;
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZoomStart;

  /* AUTOGENERATED FROM [SfCartesianChart.onZooming]*/
  /// Occurs when Zooming event is performed. Here, you can get the axis,
  /// current zoom factor, current zoom position, previous zoom factor,
  /// and previous zoom position.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior(enableSelectionZooming: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior,
  ///             onZooming: (ZoomPanArgs args) => zoom(args),
  ///         )
  ///     );
  /// }
  /// void zoom(ZoomPanArgs args) {
  ///     print(args.currentZoomPosition);
  /// }
  /// ```
  final void Function(ZoomPanArgs)? onZooming;

  /* AUTOGENERATED FROM [SfCartesianChart.palette]*/
  /// Color palette for chart series. If the series color is not specified,
  /// then the series will be rendered with appropriate palette color.
  /// Ten colors are available by default.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             palette: <Color>[Colors.red, Colors.green]
  ///           )
  ///      );
  /// }
  /// ```
  final List<Color>? palette;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBackgroundColor]*/
  /// Background color of the plot area.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            plotAreaBackgroundColor: Colors.red,
  ///        )
  ///    );
  /// }
  /// ```
  final Color? plotAreaBackgroundColor;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBackgroundImage]*/
  /// Background image for chart.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             plotAreaBackgroundImage: const AssetImage('images/bike.png'),
  ///          )
  ///      );
  /// }
  /// ```
  final ImageProvider<Object>? plotAreaBackgroundImage;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBorderColor]*/
  /// Border color of the plot area.
  ///
  /// Defaults to `null`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            plotAreaBorderColor: Colors.red,
  ///        )
  ///    );
  /// }
  /// ```
  final Color? plotAreaBorderColor;

  /* AUTOGENERATED FROM [SfCartesianChart.plotAreaBorderWidth]*/
  /// Border width of the plot area.
  ///
  /// Defaults to `0.7`.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            plotAreaBorderColor: Colors.red,
  ///            plotAreaBorderWidth: 2
  ///        )
  ///    );
  /// }
  /// ```
  final double plotAreaBorderWidth;

  /* AUTOGENERATED FROM [SfCartesianChart.primaryXAxis]*/
  /// Customizes the primary x-axis in chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            primaryXAxis: DateTimeAxis(interval: 1)
  ///        )
  ///    );
  /// }
  /// ```
  final ChartAxis primaryXAxis;

  /* AUTOGENERATED FROM [SfCartesianChart.primaryYAxis]*/
  /// Customizes the primary y-axis in chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            primaryYAxis: NumericAxis(isInversed: false)
  ///        )
  ///    );
  /// }
  /// ```
  final ChartAxis primaryYAxis;

  /* AUTOGENERATED FROM [SfCartesianChart.selectionGesture]*/
  /// Gesture for activating the selection. Selection can be activated in tap,
  /// double tap, and long press.
  ///
  /// Defaults to `ActivationMode.tap`.
  ///
  /// Also refer [ActivationMode].
  ///
  /// ```dart
  /// late SelectionBehavior _selectionBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _selectionBehavior = SelectionBehavior( enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             selectionGesture: ActivationMode.doubleTap,
  ///             series: <BarSeries<SalesData, num>>[
  ///                 BarSeries<SalesData, num>(
  ///                   selectionBehavior: _selectionBehavior
  ///                 ),
  ///               ],
  ///           )
  ///      );
  /// }
  /// ```
  final ActivationMode selectionGesture;

  /* AUTOGENERATED FROM [SfCartesianChart.selectionType]*/
  /// Mode of selecting the data points or series.
  ///
  /// Defaults to `SelectionType.point`.
  ///
  /// Also refer [SelectionType].
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            selectionType: SelectionType.series,
  ///         )
  ///     );
  /// }
  /// ```
  final SelectionType selectionType;

  /* AUTOGENERATED FROM [SfCartesianChart.series]*/
  /// Customizes the series in chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///            series: <CartesianSeries<SalesData, num>>[
  ///                 AreaSeries<SalesData, num>(
  ///                     dataSource: chartData,
  ///                 ),
  ///               ],
  ///           )
  ///      );
  /// }
  /// ```
  final List<CartesianSeries<dynamic, dynamic>> series;

  /* AUTOGENERATED FROM [SfCartesianChart.title]*/
  /// Customizes the chart title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            title: ChartTitle(
  ///                    text: 'Area with animation',
  ///                    alignment: ChartAlignment.center,
  ///                    backgroundColor: Colors.white,
  ///                    borderColor: Colors.transparent,
  ///                    borderWidth: 0)
  ///        )
  ///    );
  /// }
  /// ```
  final ChartTitle title;

  /* AUTOGENERATED FROM [SfCartesianChart.tooltipBehavior]*/
  /// Customizes the tooltip in chart.
  ///
  /// ```dart
  /// late TooltipBehavior _tooltipBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _tooltipBehavior = TooltipBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             tooltipBehavior: _tooltipBehavior
  ///           )
  ///      );
  /// }
  /// ```
  final TooltipBehavior? tooltipBehavior;

  /* AUTOGENERATED FROM [SfCartesianChart.trackballBehavior]*/
  /// Customizes the trackball in chart.
  ///
  /// ```dart
  /// late TrackballBehavior _trackballBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _trackballBehavior = TrackballBehavior(enable: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             trackballBehavior: _trackballBehavior,
  ///           )
  ///      );
  /// }
  /// ```
  final TrackballBehavior? trackballBehavior;

  /* AUTOGENERATED FROM [SfCartesianChart.zoomPanBehavior]*/
  /// Customizes the zooming and panning settings.
  ///
  /// ```dart
  /// late ZoomPanBehavior _zoomPanBehavior;
  ///
  /// @override
  /// void initState() {
  ///   _zoomPanBehavior = ZoomPanBehavior( enablePanning: true);
  ///   super.initState();
  ///  }
  ///
  /// Widget build(BuildContext context) {
  ///     return Container(
  ///         child: SfCartesianChart(
  ///             zoomPanBehavior: _zoomPanBehavior
  ///           )
  ///      );
  /// }
  /// ```
  final ZoomPanBehavior? zoomPanBehavior;

  static SfCartesianChartBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[SfCartesianChartBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SfCartesianChartBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SfCartesianChartBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is SfCartesianChartBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SfCartesianChartBuilderModel(
          args,
          annotations: map['annotations'],
          axes: map['axes'] ?? const <ChartAxis>[],
          backgroundColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['backgroundColor'],
              validate: false,
            );

            return parsed;
          }(),
          borderColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['borderColor'],
              validate: false,
            );
            parsed ??= Colors.transparent;

            return parsed;
          }(),
          borderWidth: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['borderWidth']);

            parsed ??= 0.0;

            return parsed;
          }(),
          crosshairBehavior: map['crosshairBehavior'],
          enableAxisAnimation: JsonClass.parseBool(
            map['enableAxisAnimation'],
            whenNull: false,
          ),
          enableMultiSelection: JsonClass.parseBool(
            map['enableMultiSelection'],
            whenNull: false,
          ),
          enableSideBySideSeriesPlacement: JsonClass.parseBool(
            map['enableSideBySideSeriesPlacement'],
            whenNull: true,
          ),
          indicators: map['indicators'] ?? const <TechnicalIndicator>[],
          isTransposed: JsonClass.parseBool(
            map['isTransposed'],
            whenNull: false,
          ),
          legend: map['legend'] ?? const Legend(),
          loadMoreIndicatorBuilder: map['loadMoreIndicatorBuilder'],
          margin: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsets(
              map['margin'],
              validate: false,
            );
            parsed ??= const EdgeInsets.all(10);

            return parsed;
          }(),
          onActualRangeChanged: map['onActualRangeChanged'],
          onAxisLabelTapped: map['onAxisLabelTapped'],
          onChartTouchInteractionDown: map['onChartTouchInteractionDown'],
          onChartTouchInteractionMove: map['onChartTouchInteractionMove'],
          onChartTouchInteractionUp: map['onChartTouchInteractionUp'],
          onCrosshairPositionChanging: map['onCrosshairPositionChanging'],
          onDataLabelRender: map['onDataLabelRender'],
          onDataLabelTapped: map['onDataLabelTapped'],
          onLegendItemRender: map['onLegendItemRender'],
          onLegendTapped: map['onLegendTapped'],
          onMarkerRender: map['onMarkerRender'],
          onPlotAreaSwipe: map['onPlotAreaSwipe'],
          onSelectionChanged: map['onSelectionChanged'],
          onTooltipRender: map['onTooltipRender'],
          onTrackballPositionChanging: map['onTrackballPositionChanging'],
          onZoomEnd: map['onZoomEnd'],
          onZoomReset: map['onZoomReset'],
          onZoomStart: map['onZoomStart'],
          onZooming: map['onZooming'],
          palette: map['palette'],
          plotAreaBackgroundColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['plotAreaBackgroundColor'],
              validate: false,
            );

            return parsed;
          }(),
          plotAreaBackgroundImage: map['plotAreaBackgroundImage'],
          plotAreaBorderColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['plotAreaBorderColor'],
              validate: false,
            );

            return parsed;
          }(),
          plotAreaBorderWidth: () {
            dynamic parsed = JsonClass.maybeParseDouble(
              map['plotAreaBorderWidth'],
            );

            parsed ??= 0.7;

            return parsed;
          }(),
          primaryXAxis: map['primaryXAxis'] ?? const NumericAxis(),
          primaryYAxis: map['primaryYAxis'] ?? const NumericAxis(),
          selectionGesture: map['selectionGesture'] ?? ActivationMode.singleTap,
          selectionType: map['selectionType'] ?? SelectionType.point,
          series: map['series'] ?? const <CartesianSeries>[],
          title: map['title'] ?? const ChartTitle(),
          tooltipBehavior: map['tooltipBehavior'],
          trackballBehavior: map['trackballBehavior'],
          zoomPanBehavior: map['zoomPanBehavior'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'annotations': annotations,
      'axes': const <ChartAxis>[] == axes ? null : axes,
      'backgroundColor': ThemeEncoder.encodeColor(backgroundColor),
      'borderColor': Colors.transparent == borderColor
          ? null
          : ThemeEncoder.encodeColor(borderColor),
      'borderWidth': 0.0 == borderWidth ? null : borderWidth,
      'crosshairBehavior': crosshairBehavior,
      'enableAxisAnimation': false == enableAxisAnimation
          ? null
          : enableAxisAnimation,
      'enableMultiSelection': false == enableMultiSelection
          ? null
          : enableMultiSelection,
      'enableSideBySideSeriesPlacement': true == enableSideBySideSeriesPlacement
          ? null
          : enableSideBySideSeriesPlacement,
      'indicators': const <TechnicalIndicator>[] == indicators
          ? null
          : indicators,
      'isTransposed': false == isTransposed ? null : isTransposed,
      'legend': const Legend() == legend ? null : legend,
      'loadMoreIndicatorBuilder': loadMoreIndicatorBuilder,
      'margin': const EdgeInsets.all(10) == margin
          ? null
          : ThemeEncoder.encodeEdgeInsets(margin),
      'onActualRangeChanged': onActualRangeChanged,
      'onAxisLabelTapped': onAxisLabelTapped,
      'onChartTouchInteractionDown': onChartTouchInteractionDown,
      'onChartTouchInteractionMove': onChartTouchInteractionMove,
      'onChartTouchInteractionUp': onChartTouchInteractionUp,
      'onCrosshairPositionChanging': onCrosshairPositionChanging,
      'onDataLabelRender': onDataLabelRender,
      'onDataLabelTapped': onDataLabelTapped,
      'onLegendItemRender': onLegendItemRender,
      'onLegendTapped': onLegendTapped,
      'onMarkerRender': onMarkerRender,
      'onPlotAreaSwipe': onPlotAreaSwipe,
      'onSelectionChanged': onSelectionChanged,
      'onTooltipRender': onTooltipRender,
      'onTrackballPositionChanging': onTrackballPositionChanging,
      'onZoomEnd': onZoomEnd,
      'onZoomReset': onZoomReset,
      'onZoomStart': onZoomStart,
      'onZooming': onZooming,
      'palette': palette,
      'plotAreaBackgroundColor': ThemeEncoder.encodeColor(
        plotAreaBackgroundColor,
      ),
      'plotAreaBackgroundImage': plotAreaBackgroundImage,
      'plotAreaBorderColor': ThemeEncoder.encodeColor(plotAreaBorderColor),
      'plotAreaBorderWidth': 0.7 == plotAreaBorderWidth
          ? null
          : plotAreaBorderWidth,
      'primaryXAxis': const NumericAxis() == primaryXAxis ? null : primaryXAxis,
      'primaryYAxis': const NumericAxis() == primaryYAxis ? null : primaryYAxis,
      'selectionGesture': ActivationMode.singleTap == selectionGesture
          ? null
          : selectionGesture,
      'selectionType': SelectionType.point == selectionType
          ? null
          : selectionType,
      'series': const <CartesianSeries>[] == series ? null : series,
      'title': const ChartTitle() == title ? null : title,
      'tooltipBehavior': tooltipBehavior,
      'trackballBehavior': trackballBehavior,
      'zoomPanBehavior': zoomPanBehavior,

      ...args,
    });
  }
}

class SfCartesianChartSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/sf_cartesian_chart.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SfCartesianChart',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'annotations': SchemaHelper.anySchema,
      'axes': SchemaHelper.anySchema,
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'borderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'borderWidth': SchemaHelper.numberSchema,
      'crosshairBehavior': SchemaHelper.anySchema,
      'enableAxisAnimation': SchemaHelper.boolSchema,
      'enableMultiSelection': SchemaHelper.boolSchema,
      'enableSideBySideSeriesPlacement': SchemaHelper.boolSchema,
      'indicators': SchemaHelper.anySchema,
      'isTransposed': SchemaHelper.boolSchema,
      'legend': SchemaHelper.anySchema,
      'loadMoreIndicatorBuilder': SchemaHelper.anySchema,
      'margin': SchemaHelper.objectSchema(EdgeInsetsSchema.id),
      'onActualRangeChanged': SchemaHelper.anySchema,
      'onAxisLabelTapped': SchemaHelper.anySchema,
      'onChartTouchInteractionDown': SchemaHelper.anySchema,
      'onChartTouchInteractionMove': SchemaHelper.anySchema,
      'onChartTouchInteractionUp': SchemaHelper.anySchema,
      'onCrosshairPositionChanging': SchemaHelper.anySchema,
      'onDataLabelRender': SchemaHelper.anySchema,
      'onDataLabelTapped': SchemaHelper.anySchema,
      'onLegendItemRender': SchemaHelper.anySchema,
      'onLegendTapped': SchemaHelper.anySchema,
      'onMarkerRender': SchemaHelper.anySchema,
      'onPlotAreaSwipe': SchemaHelper.anySchema,
      'onSelectionChanged': SchemaHelper.anySchema,
      'onTooltipRender': SchemaHelper.anySchema,
      'onTrackballPositionChanging': SchemaHelper.anySchema,
      'onZoomEnd': SchemaHelper.anySchema,
      'onZoomReset': SchemaHelper.anySchema,
      'onZoomStart': SchemaHelper.anySchema,
      'onZooming': SchemaHelper.anySchema,
      'palette': SchemaHelper.anySchema,
      'plotAreaBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'plotAreaBackgroundImage': SchemaHelper.anySchema,
      'plotAreaBorderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'plotAreaBorderWidth': SchemaHelper.numberSchema,
      'primaryXAxis': SchemaHelper.anySchema,
      'primaryYAxis': SchemaHelper.anySchema,
      'selectionGesture': SchemaHelper.anySchema,
      'selectionType': SchemaHelper.anySchema,
      'series': SchemaHelper.anySchema,
      'title': SchemaHelper.anySchema,
      'tooltipBehavior': SchemaHelper.anySchema,
      'trackballBehavior': SchemaHelper.anySchema,
      'zoomPanBehavior': SchemaHelper.anySchema,
    },
    'required': [],
  };
}
