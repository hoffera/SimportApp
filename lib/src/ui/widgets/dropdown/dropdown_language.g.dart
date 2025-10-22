// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_language.dart';

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

class DropdownLanguageBuilder extends _DropdownLanguageBuilder {
  const DropdownLanguageBuilder({required super.args});

  static const kType = 'dropdown_language';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DropdownLanguageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => DropdownLanguageBuilder(args: map);

  @override
  DropdownLanguageBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DropdownLanguageBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DropdownLanguage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return DropdownLanguage(
      key: key,
      textEn: model.textEn,
      textEs: model.textEs,
      textPt: model.textPt,
    );
  }
}

class JsonDropdownLanguage extends JsonWidgetData {
  JsonDropdownLanguage({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.textEn,
    required this.textEs,
    required this.textPt,
  }) : super(
         jsonWidgetArgs: DropdownLanguageBuilderModel.fromDynamic(
           {'textEn': textEn, 'textEs': textEs, 'textPt': textPt, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => DropdownLanguageBuilder(
           args: DropdownLanguageBuilderModel.fromDynamic(
             {'textEn': textEn, 'textEs': textEs, 'textPt': textPt, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: DropdownLanguageBuilder.kType,
       );

  final String textEn;

  final String textEs;

  final String textPt;
}

class DropdownLanguageBuilderModel extends JsonWidgetBuilderModel {
  const DropdownLanguageBuilderModel(
    super.args, {
    required this.textEn,
    required this.textEs,
    required this.textPt,
  });

  final String textEn;

  final String textEs;

  final String textPt;

  static DropdownLanguageBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[DropdownLanguageBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DropdownLanguageBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DropdownLanguageBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is DropdownLanguageBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DropdownLanguageBuilderModel(
          args,
          textEn: map['textEn'],
          textEs: map['textEs'],
          textPt: map['textPt'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'textEn': textEn,
      'textEs': textEs,
      'textPt': textPt,

      ...args,
    });
  }
}

class DropdownLanguageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/dropdown_language.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DropdownLanguage',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'textEn': SchemaHelper.stringSchema,
      'textEs': SchemaHelper.stringSchema,
      'textPt': SchemaHelper.stringSchema,
    },
    'required': ['textEn', 'textEs', 'textPt'],
  };
}
