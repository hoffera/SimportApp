// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_linear_graph_builder.dart';

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

class SyncLinearGraphBuilder extends _SyncLinearGraphBuilder {
  const SyncLinearGraphBuilder({required super.args});

  static const kType = 'sync_linear_graph';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SyncLinearGraphBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => SyncLinearGraphBuilder(args: map);

  @override
  SyncLinearGraphBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SyncLinearGraphBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SyncLinearGraph buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    final cartesianSeriesDecoded = _decodeCartesianSeries(
      value: model.cartesianSeries,
      registry: data.jsonWidgetRegistry,
    );
    final chartAxisDecoded = _decodeChartAxis(
      value: model.chartAxis,
      registry: data.jsonWidgetRegistry,
    );
    final chartAxisXDecoded = _decodeChartAxisX(
      value: model.chartAxisX,
      registry: data.jsonWidgetRegistry,
    );
    final heightDecoded = _height(
      value: model.height,
      registry: data.jsonWidgetRegistry,
    );

    return SyncLinearGraph(
      cartesianSeries: cartesianSeriesDecoded,
      chartAxis: chartAxisDecoded,
      chartAxisX: chartAxisXDecoded,
      height: heightDecoded,
      key: key,
    );
  }
}

class JsonSyncLinearGraph extends JsonWidgetData {
  JsonSyncLinearGraph({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.cartesianSeries,
    required this.chartAxis,
    required this.chartAxisX,
    required this.height,
  }) : super(
         jsonWidgetArgs: SyncLinearGraphBuilderModel.fromDynamic(
           {
             'cartesianSeries': cartesianSeries,
             'chartAxis': chartAxis,
             'chartAxisX': chartAxisX,
             'height': height,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => SyncLinearGraphBuilder(
           args: SyncLinearGraphBuilderModel.fromDynamic(
             {
               'cartesianSeries': cartesianSeries,
               'chartAxis': chartAxis,
               'chartAxisX': chartAxisX,
               'height': height,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: SyncLinearGraphBuilder.kType,
       );

  final dynamic cartesianSeries;

  final dynamic chartAxis;

  final dynamic chartAxisX;

  final dynamic height;
}

class SyncLinearGraphBuilderModel extends JsonWidgetBuilderModel {
  const SyncLinearGraphBuilderModel(
    super.args, {
    required this.cartesianSeries,
    required this.chartAxis,
    required this.chartAxisX,
    required this.height,
  });

  final dynamic cartesianSeries;

  final dynamic chartAxis;

  final dynamic chartAxisX;

  final dynamic height;

  static SyncLinearGraphBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[SyncLinearGraphBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SyncLinearGraphBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SyncLinearGraphBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is SyncLinearGraphBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SyncLinearGraphBuilderModel(
          args,
          cartesianSeries: map['cartesianSeries'],
          chartAxis: map['chartAxis'],
          chartAxisX: map['chartAxisX'],
          height: map['height'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'cartesianSeries': cartesianSeries,
      'chartAxis': chartAxis,
      'chartAxisX': chartAxisX,
      'height': height,

      ...args,
    });
  }
}

class SyncLinearGraphSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/sync_linear_graph.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SyncLinearGraph',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'cartesianSeries': SchemaHelper.anySchema,
      'chartAxis': SchemaHelper.anySchema,
      'chartAxisX': SchemaHelper.anySchema,
      'height': SchemaHelper.numberSchema,
    },
    'required': ['cartesianSeries', 'chartAxis', 'chartAxisX'],
  };
}
