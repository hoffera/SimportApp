// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_app/widgetbook/usecase/sync_linear_graph_usecase.dart'
    as _json_app_widgetbook_usecase_sync_linear_graph_usecase;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'app',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'components',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'sync',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'linear_chart',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'SyncLinearGraph',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Linear (1 linha)',
                        builder:
                            _json_app_widgetbook_usecase_sync_linear_graph_usecase
                                .buildSyncLinearGraphUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Gráfico: Linear (2 Linhas), unidade diferentes',
                        builder:
                            _json_app_widgetbook_usecase_sync_linear_graph_usecase
                                .buildSyncLinearGraphMultiUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Plotbands',
                        builder:
                            _json_app_widgetbook_usecase_sync_linear_graph_usecase
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
