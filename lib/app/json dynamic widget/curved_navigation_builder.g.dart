// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curved_navigation_builder.dart';

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

class CurvedNavBarBuilder extends _CurvedNavBarBuilder {
  const CurvedNavBarBuilder({required super.args});

  static const kType = 'curved_nav';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static CurvedNavBarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => CurvedNavBarBuilder(args: map);

  @override
  CurvedNavBarBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = CurvedNavBarBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  CurvedNav buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    final iconsDecoded = _decodeIcons(
      value: model.icons,
      registry: data.jsonWidgetRegistry,
    );

    return CurvedNav(
      icons: iconsDecoded,
      key: key,
      registryKey: model.registryKey,
    );
  }
}

class JsonCurvedNav extends JsonWidgetData {
  JsonCurvedNav({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.icons,
    this.registryKey,
  }) : super(
         jsonWidgetArgs: CurvedNavBarBuilderModel.fromDynamic(
           {'icons': icons, 'registryKey': registryKey, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => CurvedNavBarBuilder(
           args: CurvedNavBarBuilderModel.fromDynamic(
             {'icons': icons, 'registryKey': registryKey, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: CurvedNavBarBuilder.kType,
       );

  final dynamic icons;

  final String? registryKey;
}

class CurvedNavBarBuilderModel extends JsonWidgetBuilderModel {
  const CurvedNavBarBuilderModel(
    super.args, {
    required this.icons,
    this.registryKey,
  });

  final dynamic icons;

  final String? registryKey;

  static CurvedNavBarBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[CurvedNavBarBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static CurvedNavBarBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    CurvedNavBarBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is CurvedNavBarBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = CurvedNavBarBuilderModel(
          args,
          icons: map['icons'],
          registryKey: map['registryKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'icons': icons,
      'registryKey': registryKey,

      ...args,
    });
  }
}

class CurvedNavSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/curved_nav.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'CurvedNav',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'icons': SchemaHelper.anySchema,
      'registryKey': SchemaHelper.stringSchema,
    },
    'required': ['icons'],
  };
}
