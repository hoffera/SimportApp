// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mare_card.dart';

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

class MareCardBuilder extends _MareCardBuilder {
  const MareCardBuilder({required super.args});

  static const kType = 'mare_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static MareCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => MareCardBuilder(args: map);

  @override
  MareCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = MareCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  MareCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return MareCard(key: key);
  }
}

class JsonMareCard extends JsonWidgetData {
  JsonMareCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) : super(
         jsonWidgetArgs: MareCardBuilderModel.fromDynamic(
           {...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => MareCardBuilder(
           args: MareCardBuilderModel.fromDynamic(
             {...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: MareCardBuilder.kType,
       );
}

class MareCardBuilderModel extends JsonWidgetBuilderModel {
  const MareCardBuilderModel(super.args);

  static MareCardBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[MareCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static MareCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    MareCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is MareCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = MareCardBuilderModel(args);
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({...args});
  }
}

class MareCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/mare_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'MareCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {},
    'required': [],
  };
}
