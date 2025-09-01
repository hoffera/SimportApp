// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_drawer.dart';

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

class DefaultDrawerBuilder extends _DefaultDrawerBuilder {
  const DefaultDrawerBuilder({required super.args});

  static const kType = 'default_drawer';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DefaultDrawerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => DefaultDrawerBuilder(args: map);

  @override
  DefaultDrawerBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DefaultDrawerBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DefaultDrawer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return DefaultDrawer(
      clientLogo: model.clientLogo,
      clientName: model.clientName,
      clientSubtitle: model.clientSubtitle,
      email: model.email,
      key: key,
      name: model.name,
      since: model.since,
      subtitle: model.subtitle,
      url: model.url,
    );
  }
}

class JsonDefaultDrawer extends JsonWidgetData {
  JsonDefaultDrawer({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.clientLogo,
    required this.clientName,
    required this.clientSubtitle,
    required this.email,
    required this.name,
    required this.since,
    required this.subtitle,
    required this.url,
  }) : super(
         jsonWidgetArgs: DefaultDrawerBuilderModel.fromDynamic(
           {
             'clientLogo': clientLogo,
             'clientName': clientName,
             'clientSubtitle': clientSubtitle,
             'email': email,
             'name': name,
             'since': since,
             'subtitle': subtitle,
             'url': url,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => DefaultDrawerBuilder(
           args: DefaultDrawerBuilderModel.fromDynamic(
             {
               'clientLogo': clientLogo,
               'clientName': clientName,
               'clientSubtitle': clientSubtitle,
               'email': email,
               'name': name,
               'since': since,
               'subtitle': subtitle,
               'url': url,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: DefaultDrawerBuilder.kType,
       );

  final String clientLogo;

  final String clientName;

  final String clientSubtitle;

  final String email;

  final String name;

  final String since;

  final String subtitle;

  final String url;
}

class DefaultDrawerBuilderModel extends JsonWidgetBuilderModel {
  const DefaultDrawerBuilderModel(
    super.args, {
    required this.clientLogo,
    required this.clientName,
    required this.clientSubtitle,
    required this.email,
    required this.name,
    required this.since,
    required this.subtitle,
    required this.url,
  });

  final String clientLogo;

  final String clientName;

  final String clientSubtitle;

  final String email;

  final String name;

  final String since;

  final String subtitle;

  final String url;

  static DefaultDrawerBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[DefaultDrawerBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DefaultDrawerBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DefaultDrawerBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is DefaultDrawerBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DefaultDrawerBuilderModel(
          args,
          clientLogo: map['clientLogo'],
          clientName: map['clientName'],
          clientSubtitle: map['clientSubtitle'],
          email: map['email'],
          name: map['name'],
          since: map['since'],
          subtitle: map['subtitle'],
          url: map['url'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'clientLogo': clientLogo,
      'clientName': clientName,
      'clientSubtitle': clientSubtitle,
      'email': email,
      'name': name,
      'since': since,
      'subtitle': subtitle,
      'url': url,

      ...args,
    });
  }
}

class DefaultDrawerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/default_drawer.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DefaultDrawer',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'clientLogo': SchemaHelper.stringSchema,
      'clientName': SchemaHelper.stringSchema,
      'clientSubtitle': SchemaHelper.stringSchema,
      'email': SchemaHelper.stringSchema,
      'name': SchemaHelper.stringSchema,
      'since': SchemaHelper.stringSchema,
      'subtitle': SchemaHelper.stringSchema,
      'url': SchemaHelper.stringSchema,
    },
    'required': [
      'clientLogo',
      'clientName',
      'clientSubtitle',
      'email',
      'name',
      'since',
      'subtitle',
      'url',
    ],
  };
}
