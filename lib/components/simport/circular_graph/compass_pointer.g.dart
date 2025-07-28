// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compass_pointer.dart';

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

class CompassPointerBuilder extends _CompassPointerBuilder {
  const CompassPointerBuilder({required super.args});

  static const kType = 'compass_pointer';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static CompassPointerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => CompassPointerBuilder(args: map);

  @override
  CompassPointerBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = CompassPointerBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  CompassPointer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return CompassPointer(
      angleDegrees: model.angleDegrees,
      arrowOutward: model.arrowOutward,
      key: key,
      pointerColor: model.pointerColor,
    );
  }
}

class JsonCompassPointer extends JsonWidgetData {
  JsonCompassPointer({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.angleDegrees,
    required this.arrowOutward,
    required this.pointerColor,
  }) : super(
         jsonWidgetArgs: CompassPointerBuilderModel.fromDynamic(
           {
             'angleDegrees': angleDegrees,
             'arrowOutward': arrowOutward,
             'pointerColor': pointerColor,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => CompassPointerBuilder(
           args: CompassPointerBuilderModel.fromDynamic(
             {
               'angleDegrees': angleDegrees,
               'arrowOutward': arrowOutward,
               'pointerColor': pointerColor,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: CompassPointerBuilder.kType,
       );

  final double angleDegrees;

  final bool arrowOutward;

  final Color pointerColor;
}

class CompassPointerBuilderModel extends JsonWidgetBuilderModel {
  const CompassPointerBuilderModel(
    super.args, {
    required this.angleDegrees,
    required this.arrowOutward,
    required this.pointerColor,
  });

  final double angleDegrees;

  final bool arrowOutward;

  final Color pointerColor;

  static CompassPointerBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[CompassPointerBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static CompassPointerBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    CompassPointerBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is CompassPointerBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = CompassPointerBuilderModel(
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

      ...args,
    });
  }
}

class CompassPointerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/compass_pointer.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'CompassPointer',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'angleDegrees': SchemaHelper.numberSchema,
      'arrowOutward': SchemaHelper.boolSchema,
      'pointerColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
    'required': ['angleDegrees', 'arrowOutward', 'pointerColor'],
  };
}
