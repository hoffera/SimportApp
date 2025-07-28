// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_widget.dart';

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

class TitleWidgetBuilder extends _TitleWidgetBuilder {
  const TitleWidgetBuilder({required super.args});

  static const kType = 'title_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static TitleWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => TitleWidgetBuilder(args: map);

  @override
  TitleWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = TitleWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  TitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return TitleWidget(key: key, title: model.title);
  }
}

class JsonTitleWidget extends JsonWidgetData {
  JsonTitleWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.title,
  }) : super(
         jsonWidgetArgs: TitleWidgetBuilderModel.fromDynamic(
           {'title': title, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => TitleWidgetBuilder(
           args: TitleWidgetBuilderModel.fromDynamic(
             {'title': title, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: TitleWidgetBuilder.kType,
       );

  final String title;
}

class TitleWidgetBuilderModel extends JsonWidgetBuilderModel {
  const TitleWidgetBuilderModel(super.args, {required this.title});

  final String title;

  static TitleWidgetBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[TitleWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static TitleWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    TitleWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is TitleWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = TitleWidgetBuilderModel(args, title: map['title']);
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({'title': title, ...args});
  }
}

class TitleWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/title_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'TitleWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {'title': SchemaHelper.stringSchema},
    'required': ['title'],
  };
}
