// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commom_card.dart';

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

class CommomCardBuilder extends _CommomCardBuilder {
  const CommomCardBuilder({required super.args});

  static const kType = 'commom_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static CommomCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => CommomCardBuilder(args: map);

  @override
  CommomCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = CommomCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  CommomCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return CommomCard(
      iconURL: model.iconURL,
      key: key,
      subtitle: model.subtitle,
      title: model.title,
    );
  }
}

class JsonCommomCard extends JsonWidgetData {
  JsonCommomCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.iconURL,
    required this.subtitle,
    required this.title,
  }) : super(
         jsonWidgetArgs: CommomCardBuilderModel.fromDynamic(
           {'iconURL': iconURL, 'subtitle': subtitle, 'title': title, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => CommomCardBuilder(
           args: CommomCardBuilderModel.fromDynamic(
             {
               'iconURL': iconURL,
               'subtitle': subtitle,
               'title': title,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: CommomCardBuilder.kType,
       );

  final String iconURL;

  final String subtitle;

  final String title;
}

class CommomCardBuilderModel extends JsonWidgetBuilderModel {
  const CommomCardBuilderModel(
    super.args, {
    required this.iconURL,
    required this.subtitle,
    required this.title,
  });

  final String iconURL;

  final String subtitle;

  final String title;

  static CommomCardBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[CommomCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static CommomCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    CommomCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is CommomCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = CommomCardBuilderModel(
          args,
          iconURL: map['iconURL'],
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
      'iconURL': iconURL,
      'subtitle': subtitle,
      'title': title,

      ...args,
    });
  }
}

class CommomCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/commom_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'CommomCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'iconURL': SchemaHelper.stringSchema,
      'subtitle': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
    },
    'required': ['iconURL', 'subtitle', 'title'],
  };
}
