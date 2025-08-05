// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_widget.dart';

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

class IconWidgetBuilder extends _IconWidgetBuilder {
  const IconWidgetBuilder({required super.args});

  static const kType = 'icon_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static IconWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => IconWidgetBuilder(args: map);

  @override
  IconWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = IconWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  IconWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return IconWidget(key: key, urlIcon: model.urlIcon);
  }
}

class JsonIconWidget extends JsonWidgetData {
  JsonIconWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.urlIcon,
  }) : super(
         jsonWidgetArgs: IconWidgetBuilderModel.fromDynamic(
           {'urlIcon': urlIcon, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => IconWidgetBuilder(
           args: IconWidgetBuilderModel.fromDynamic(
             {'urlIcon': urlIcon, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: IconWidgetBuilder.kType,
       );

  final String urlIcon;
}

class IconWidgetBuilderModel extends JsonWidgetBuilderModel {
  const IconWidgetBuilderModel(super.args, {required this.urlIcon});

  final String urlIcon;

  static IconWidgetBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[IconWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static IconWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    IconWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is IconWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = IconWidgetBuilderModel(args, urlIcon: map['urlIcon']);
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({'urlIcon': urlIcon, ...args});
  }
}

class IconWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/icon_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'IconWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {'urlIcon': SchemaHelper.stringSchema},
    'required': ['urlIcon'],
  };
}
