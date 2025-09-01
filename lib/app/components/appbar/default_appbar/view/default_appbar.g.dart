// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_appbar.dart';

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

class DefaultAppBarBuilder extends _DefaultAppBarBuilder {
  const DefaultAppBarBuilder({required super.args});

  static const kType = 'default_app_bar';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DefaultAppBarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => DefaultAppBarBuilder(args: map);

  @override
  DefaultAppBarBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DefaultAppBarBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DefaultAppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return DefaultAppBar(
      key: key,
      name: model.name,
      title: model.title,
      url: model.url,
    );
  }
}

class JsonDefaultAppBar extends JsonWidgetData {
  JsonDefaultAppBar({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.name,
    this.title,
    required this.url,
  }) : super(
         jsonWidgetArgs: DefaultAppBarBuilderModel.fromDynamic(
           {'name': name, 'title': title, 'url': url, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => DefaultAppBarBuilder(
           args: DefaultAppBarBuilderModel.fromDynamic(
             {'name': name, 'title': title, 'url': url, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: DefaultAppBarBuilder.kType,
       );

  final String name;

  final String? title;

  final String url;
}

class DefaultAppBarBuilderModel extends JsonWidgetBuilderModel {
  const DefaultAppBarBuilderModel(
    super.args, {
    required this.name,
    this.title,
    required this.url,
  });

  final String name;

  final String? title;

  final String url;

  static DefaultAppBarBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[DefaultAppBarBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DefaultAppBarBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DefaultAppBarBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is DefaultAppBarBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DefaultAppBarBuilderModel(
          args,
          name: map['name'],
          title: map['title'],
          url: map['url'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'name': name,
      'title': title,
      'url': url,

      ...args,
    });
  }
}

class DefaultAppBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/default_app_bar.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DefaultAppBar',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'name': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
      'url': SchemaHelper.stringSchema,
    },
    'required': ['name', 'url'],
  };
}
