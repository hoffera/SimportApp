// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_widget.dart';

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

class ChartWidgetBuilder extends _ChartWidgetBuilder {
  const ChartWidgetBuilder({required super.args});

  static const kType = 'chart_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static ChartWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => ChartWidgetBuilder(args: map);

  @override
  ChartWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = ChartWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  ChartWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return ChartWidget(
      chart: model.chart.build(childBuilder: childBuilder, context: context),
      key: key,
      subtitle: model.subtitle,
      title: model.title,
    );
  }
}

class JsonChartWidget extends JsonWidgetData {
  JsonChartWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.chart,
    required this.subtitle,
    required this.title,
  }) : super(
         jsonWidgetArgs: ChartWidgetBuilderModel.fromDynamic(
           {'chart': chart, 'subtitle': subtitle, 'title': title, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => ChartWidgetBuilder(
           args: ChartWidgetBuilderModel.fromDynamic(
             {'chart': chart, 'subtitle': subtitle, 'title': title, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: ChartWidgetBuilder.kType,
       );

  final JsonWidgetData chart;

  final String subtitle;

  final String title;
}

class ChartWidgetBuilderModel extends JsonWidgetBuilderModel {
  const ChartWidgetBuilderModel(
    super.args, {
    required this.chart,
    required this.subtitle,
    required this.title,
  });

  final JsonWidgetData chart;

  final String subtitle;

  final String title;

  static ChartWidgetBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[ChartWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static ChartWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    ChartWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is ChartWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = ChartWidgetBuilderModel(
          args,
          chart: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['chart'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [chart].',
              );
            }
            return parsed;
          }(),
          subtitle: map['subtitle'],
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'chart': chart.toJson(),
      'subtitle': subtitle,
      'title': title,

      ...args,
    });
  }
}

class ChartWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/chart_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ChartWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'chart': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'subtitle': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
    },
    'required': ['chart', 'subtitle', 'title'],
  };
}
