// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_json_widget.dart';

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

class ButtonJsonWidgetBuilder extends _ButtonJsonWidgetBuilder {
  const ButtonJsonWidgetBuilder({required super.args});

  static const kType = 'button_json_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static ButtonJsonWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => ButtonJsonWidgetBuilder(args: map);

  @override
  ButtonJsonWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = ButtonJsonWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  ButtonJsonWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return ButtonJsonWidget(
      key: key,
      widgetJson: model.widgetJson,
      child: model.child.build(childBuilder: childBuilder, context: context),
    );
  }
}

class JsonButtonJsonWidget extends JsonWidgetData {
  JsonButtonJsonWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.widgetJson,
    required this.child,
  }) : super(
         jsonWidgetArgs: ButtonJsonWidgetBuilderModel.fromDynamic(
           {'widgetJson': widgetJson, 'child': child, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => ButtonJsonWidgetBuilder(
           args: ButtonJsonWidgetBuilderModel.fromDynamic(
             {'widgetJson': widgetJson, 'child': child, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: ButtonJsonWidgetBuilder.kType,
       );

  final String widgetJson;

  final JsonWidgetData child;
}

class ButtonJsonWidgetBuilderModel extends JsonWidgetBuilderModel {
  const ButtonJsonWidgetBuilderModel(
    super.args, {
    required this.widgetJson,
    required this.child,
  });

  final String widgetJson;

  final JsonWidgetData child;

  static ButtonJsonWidgetBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[ButtonJsonWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static ButtonJsonWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    ButtonJsonWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is ButtonJsonWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = ButtonJsonWidgetBuilderModel(
          args,
          widgetJson: map['widgetJson'],
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
    return JsonClass.removeNull({
      'widgetJson': widgetJson,
      'child': child.toJson(),

      ...args,
    });
  }
}

class ButtonJsonWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/button_json_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ButtonJsonWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'widgetJson': SchemaHelper.stringSchema,
      'child': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
    'required': ['widgetJson', 'child'],
  };
}
