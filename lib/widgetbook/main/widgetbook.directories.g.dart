// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_app/widgetbook/usecase/circular%20graph/circular_graph_usecase.dart'
    as _json_app_widgetbook_usecase_circular_20graph_circular_graph_usecase;
import 'package:json_app/widgetbook/usecase/linear%20graph/sync_linear_graph_usecase.dart'
    as _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'app',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'components',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'simport',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'circular_graph',
                children: [
                  _widgetbook.WidgetbookLeafComponent(
                    name: 'CircularGraph',
                    useCase: _widgetbook.WidgetbookUseCase(
                      name: 'Gráfico default',
                      builder:
                          _json_app_widgetbook_usecase_circular_20graph_circular_graph_usecase
                              .buildCircularGraphUseCase,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'sync',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'circular_chart',
                children: [
                  _widgetbook.WidgetbookLeafComponent(
                    name: 'CircularChart',
                    useCase: _widgetbook.WidgetbookUseCase(
                      name: 'Gráfico default',
                      builder:
                          _json_app_widgetbook_usecase_circular_20graph_circular_graph_usecase
                              .buildCircularChartUseCase,
                    ),
                  ),
                ],
              ),
              _widgetbook.WidgetbookFolder(
                name: 'linear_chart',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'SyncLinearGraph',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Linear (1 linha)',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncLinearGraphUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Linear (2 Linhas)',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncLinearGraphMult,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Multiplas unidades',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncLinearGraphMultiUnity,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Range',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncRangeGraphUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Scatter',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncScatterGraphUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Linha tracejada',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncLinearGraphDashedUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Plotbands',
                        builder:
                            _json_app_widgetbook_usecase_linear_20graph_sync_linear_graph_usecase
                                .buildSyncLinearGraphWithPlotBandsUseCase,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
