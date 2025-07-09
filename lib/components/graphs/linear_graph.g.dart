// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_graph.dart';

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

class LinearGraphBuilder extends _LinearGraphBuilder {
  const LinearGraphBuilder({required super.args});

  static const kType = 'linear_graph';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LinearGraphBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => LinearGraphBuilder(args: map);

  @override
  LinearGraphBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LinearGraphBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LinearGraph buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return LinearGraph(
      key: key,
      maximum: model.maximum,
      minimum: model.minimum,
      value: model.value,
    );
  }
}

class JsonLinearGraph extends JsonWidgetData {
  JsonLinearGraph({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.maximum,
    required this.minimum,
    required this.value,
  }) : super(
         jsonWidgetArgs: LinearGraphBuilderModel.fromDynamic(
           {'maximum': maximum, 'minimum': minimum, 'value': value, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => LinearGraphBuilder(
           args: LinearGraphBuilderModel.fromDynamic(
             {'maximum': maximum, 'minimum': minimum, 'value': value, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: LinearGraphBuilder.kType,
       );

  final double maximum;

  final double minimum;

  final double value;
}

class LinearGraphBuilderModel extends JsonWidgetBuilderModel {
  const LinearGraphBuilderModel(
    super.args, {
    required this.maximum,
    required this.minimum,
    required this.value,
  });

  final double maximum;

  final double minimum;

  final double value;

  static LinearGraphBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[LinearGraphBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LinearGraphBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LinearGraphBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is LinearGraphBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LinearGraphBuilderModel(
          args,
          maximum: () {
            dynamic parsed = JsonClass.parseDouble(map['maximum']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [maximum].',
              );
            }
            return parsed;
          }(),
          minimum: () {
            dynamic parsed = JsonClass.parseDouble(map['minimum']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [minimum].',
              );
            }
            return parsed;
          }(),
          value: () {
            dynamic parsed = JsonClass.parseDouble(map['value']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [value].',
              );
            }
            return parsed;
          }(),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'maximum': maximum,
      'minimum': minimum,
      'value': value,

      ...args,
    });
  }
}

class LinearGraphSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/linear_graph.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LinearGraph',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'maximum': SchemaHelper.numberSchema,
      'minimum': SchemaHelper.numberSchema,
      'value': SchemaHelper.numberSchema,
    },
    'required': ['maximum', 'minimum', 'value'],
  };
}
