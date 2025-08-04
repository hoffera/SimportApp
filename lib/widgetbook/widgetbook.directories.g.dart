// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_app/components/chart/chart_widget_usecase.dart'
    as _json_app_components_chart_chart_widget_usecase;
import 'package:json_app/components/synfusion/sync_linear_graph.dart'
    as _json_app_components_synfusion_sync_linear_graph;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'components',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'chart',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'ChartWidget',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'default',
                builder: _json_app_components_chart_chart_widget_usecase
                    .buildChartWidgetUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'minimal_data',
                builder: _json_app_components_chart_chart_widget_usecase
                    .buildChartWidgetMinimalDataUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'multiple_series',
                builder: _json_app_components_chart_chart_widget_usecase
                    .buildChartWidgetMultipleSeriesUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'with_plot_bands',
                builder: _json_app_components_chart_chart_widget_usecase
                    .buildChartWidgetWithPlotBandsUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'synfusion',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'SyncLinearGraph',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'SyncLinearGraph Default',
              builder: _json_app_components_synfusion_sync_linear_graph
                  .defaultSyncLinearGraph,
            ),
          ),
        ],
      ),
    ],
  ),
];
