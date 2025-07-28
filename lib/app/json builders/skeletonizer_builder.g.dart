// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skeletonizer_builder.dart';

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

class SkeletonLoadingBuilder extends _SkeletonLoadingBuilder {
  const SkeletonLoadingBuilder({required super.args});

  static const kType = 'skeleton_loading';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SkeletonLoadingBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => SkeletonLoadingBuilder(args: map);

  @override
  SkeletonLoadingBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SkeletonLoadingBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SkeletonLoading buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return SkeletonLoading(
      key: key,
      child: model.child.build(childBuilder: childBuilder, context: context),
    );
  }
}

class JsonSkeletonLoading extends JsonWidgetData {
  JsonSkeletonLoading({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.child,
  }) : super(
         jsonWidgetArgs: SkeletonLoadingBuilderModel.fromDynamic(
           {'child': child, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => SkeletonLoadingBuilder(
           args: SkeletonLoadingBuilderModel.fromDynamic(
             {'child': child, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: SkeletonLoadingBuilder.kType,
       );

  final JsonWidgetData child;
}

class SkeletonLoadingBuilderModel extends JsonWidgetBuilderModel {
  const SkeletonLoadingBuilderModel(super.args, {required this.child});

  final JsonWidgetData child;

  static SkeletonLoadingBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[SkeletonLoadingBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SkeletonLoadingBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SkeletonLoadingBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is SkeletonLoadingBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SkeletonLoadingBuilderModel(
          args,
          child: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['child'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [child].',
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
    return JsonClass.removeNull({'child': child.toJson(), ...args});
  }
}

class SkeletonLoadingSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/skeleton_loading.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SkeletonLoading',
    'type': 'object',
    'additionalProperties': false,
    'properties': {'child': SchemaHelper.objectSchema(JsonWidgetDataSchema.id)},
    'required': ['child'],
  };
}
