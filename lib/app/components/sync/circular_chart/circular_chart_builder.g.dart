// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circular_chart_builder.dart';

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

class CircularChartBuilder extends _CircularChartBuilder {
  const CircularChartBuilder({required super.args});

  static const kType = 'circular_chart';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static CircularChartBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => CircularChartBuilder(args: map);

  @override
  CircularChartBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = CircularChartBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  CircularChart buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    final angleDegreesDecoded = _angleDegrees(
      value: model.angleDegrees,
      registry: data.jsonWidgetRegistry,
    );
    final arrowOutwardDecoded = _arrowOutward(
      value: model.arrowOutward,
      registry: data.jsonWidgetRegistry,
    );
    final heightDecoded = _height(
      value: model.height,
      registry: data.jsonWidgetRegistry,
    );
    final subtitleDecoded = _subtitle(
      value: model.subtitle,
      registry: data.jsonWidgetRegistry,
    );
    final titleDecoded = _title(
      value: model.title,
      registry: data.jsonWidgetRegistry,
    );

    return CircularChart(
      angleDegrees: angleDegreesDecoded,
      arrowOutward: arrowOutwardDecoded,
      height: heightDecoded,
      key: key,
      subtitle: subtitleDecoded,
      title: titleDecoded,
    );
  }
}

class JsonCircularChart extends JsonWidgetData {
  JsonCircularChart({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.angleDegrees,
    required this.arrowOutward,
    required this.height,
    required this.subtitle,
    required this.title,
  }) : super(
         jsonWidgetArgs: CircularChartBuilderModel.fromDynamic(
           {
             'angleDegrees': angleDegrees,
             'arrowOutward': arrowOutward,
             'height': height,
             'subtitle': subtitle,
             'title': title,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => CircularChartBuilder(
           args: CircularChartBuilderModel.fromDynamic(
             {
               'angleDegrees': angleDegrees,
               'arrowOutward': arrowOutward,
               'height': height,
               'subtitle': subtitle,
               'title': title,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: CircularChartBuilder.kType,
       );

  final dynamic angleDegrees;

  final dynamic arrowOutward;

  final dynamic height;

  final dynamic subtitle;

  final dynamic title;
}

class CircularChartBuilderModel extends JsonWidgetBuilderModel {
  const CircularChartBuilderModel(
    super.args, {
    required this.angleDegrees,
    required this.arrowOutward,
    required this.height,
    required this.subtitle,
    required this.title,
  });

  final dynamic angleDegrees;

  final dynamic arrowOutward;

  final dynamic height;

  final dynamic subtitle;

  final dynamic title;

  static CircularChartBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[CircularChartBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static CircularChartBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    CircularChartBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is CircularChartBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = CircularChartBuilderModel(
          args,
          angleDegrees: map['angleDegrees'],
          arrowOutward: map['arrowOutward'],
          height: map['height'],
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
      'angleDegrees': angleDegrees,
      'arrowOutward': arrowOutward,
      'height': height,
      'subtitle': subtitle,
      'title': title,

      ...args,
    });
  }
}

class CircularChartSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/circular_chart.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'CircularChart',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'angleDegrees': SchemaHelper.numberSchema,
      'arrowOutward': SchemaHelper.boolSchema,
      'height': SchemaHelper.numberSchema,
      'subtitle': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
    },
    'required': ['angleDegrees', 'arrowOutward', 'title'],
  };
}
