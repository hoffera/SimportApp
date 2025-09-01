// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_index.dart';

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

class PageIndexBuilder extends _PageIndexBuilder {
  const PageIndexBuilder({required super.args});

  static const kType = 'page_index';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static PageIndexBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => PageIndexBuilder(args: map);

  @override
  PageIndexBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = PageIndexBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  PageIndex buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return PageIndex(
      index: model.index,
      key: key,
      children: [
        for (var d in model.children)
          d.build(childBuilder: childBuilder, context: context),
      ],
    );
  }
}

class JsonPageIndex extends JsonWidgetData {
  JsonPageIndex({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.index,
    required this.children,
  }) : super(
         jsonWidgetArgs: PageIndexBuilderModel.fromDynamic(
           {'index': index, 'children': children, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => PageIndexBuilder(
           args: PageIndexBuilderModel.fromDynamic(
             {'index': index, 'children': children, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: PageIndexBuilder.kType,
       );

  final int index;

  final List<JsonWidgetData> children;
}

class PageIndexBuilderModel extends JsonWidgetBuilderModel {
  const PageIndexBuilderModel(
    super.args, {
    required this.index,
    required this.children,
  });

  final int index;

  final List<JsonWidgetData> children;

  static PageIndexBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[PageIndexBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static PageIndexBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    PageIndexBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is PageIndexBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = PageIndexBuilderModel(
          args,
          index: () {
            dynamic parsed = JsonClass.parseInt(map['index']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [index].',
              );
            }
            return parsed;
          }(),
          children: () {
            dynamic parsed = JsonWidgetData.fromDynamicList(
              map['children'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [children].',
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
      'index': index,
      'children': JsonClass.toJsonList(children),

      ...args,
    });
  }
}

class PageIndexSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/page_index.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'PageIndex',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'index': SchemaHelper.numberSchema,
      'children': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
    },
    'required': ['index', 'children'],
  };
}
