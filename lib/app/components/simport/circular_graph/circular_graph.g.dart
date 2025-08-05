// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circular_graph.dart';

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

class CircularGraphBuilder extends _CircularGraphBuilder {
  const CircularGraphBuilder({required super.args});

  static const kType = 'circular_graph';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static CircularGraphBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => CircularGraphBuilder(args: map);

  @override
  CircularGraphBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = CircularGraphBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  CircularGraph buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return CircularGraph(
      angleDegrees: model.angleDegrees,
      arrowOutward: model.arrowOutward,
      key: key,
      pointerColor: model.pointerColor,
      title: model.title,
    );
  }
}

class JsonCircularGraph extends JsonWidgetData {
  JsonCircularGraph({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.angleDegrees,
    required this.arrowOutward,
    required this.pointerColor,
    required this.title,
  }) : super(
         jsonWidgetArgs: CircularGraphBuilderModel.fromDynamic(
           {
             'angleDegrees': angleDegrees,
             'arrowOutward': arrowOutward,
             'pointerColor': pointerColor,
             'title': title,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => CircularGraphBuilder(
           args: CircularGraphBuilderModel.fromDynamic(
             {
               'angleDegrees': angleDegrees,
               'arrowOutward': arrowOutward,
               'pointerColor': pointerColor,
               'title': title,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: CircularGraphBuilder.kType,
       );

  final double angleDegrees;

  final bool arrowOutward;

  final Color pointerColor;

  final String title;
}

class CircularGraphBuilderModel extends JsonWidgetBuilderModel {
  const CircularGraphBuilderModel(
    super.args, {
    required this.angleDegrees,
    required this.arrowOutward,
    required this.pointerColor,
    required this.title,
  });

  final double angleDegrees;

  final bool arrowOutward;

  final Color pointerColor;

  final String title;

  static CircularGraphBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[CircularGraphBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static CircularGraphBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    CircularGraphBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is CircularGraphBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = CircularGraphBuilderModel(
          args,
          angleDegrees: () {
            dynamic parsed = JsonClass.parseDouble(map['angleDegrees']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [angleDegrees].',
              );
            }
            return parsed;
          }(),
          arrowOutward: JsonClass.parseBool(
            map['arrowOutward'],
            whenNull: false,
          ),
          pointerColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['pointerColor'],
              validate: false,
            );

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [pointerColor].',
              );
            }
            return parsed;
          }(),
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
      'pointerColor': ThemeEncoder.encodeColor(pointerColor),
      'title': title,

      ...args,
    });
  }
}

class CircularGraphSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/circular_graph.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'CircularGraph',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'angleDegrees': SchemaHelper.numberSchema,
      'arrowOutward': SchemaHelper.boolSchema,
      'pointerColor': SchemaHelper.objectSchema(ColorSchema.id),
      'title': SchemaHelper.stringSchema,
    },
    'required': ['angleDegrees', 'arrowOutward', 'pointerColor', 'title'],
  };
}
