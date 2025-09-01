// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_box_widget_builder.dart';

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

class MapBoxWidgetBuilder extends _MapBoxWidgetBuilder {
  const MapBoxWidgetBuilder({required super.args});

  static const kType = 'map_box_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static MapBoxWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => MapBoxWidgetBuilder(args: map);

  @override
  MapBoxWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = MapBoxWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  MapBoxWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    final dataDecoded = _decodeMapWidgetLayer(
      value: model.data,
      registry: data.jsonWidgetRegistry,
    );
    final initialPositionDecoded = _decodePosition(
      value: model.initialPosition,
      registry: data.jsonWidgetRegistry,
    );
    final pinsDecoded = _decodePins(
      value: model.pins,
      registry: data.jsonWidgetRegistry,
    );

    return MapBoxWidget(
      data: dataDecoded,
      initialPosition: initialPositionDecoded,
      key: key,
      pins: pinsDecoded,
    );
  }
}

class JsonMapBoxWidget extends JsonWidgetData {
  JsonMapBoxWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.data,
    required this.initialPosition,
    required this.pins,
  }) : super(
         jsonWidgetArgs: MapBoxWidgetBuilderModel.fromDynamic(
           {
             'data': data,
             'initialPosition': initialPosition,
             'pins': pins,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => MapBoxWidgetBuilder(
           args: MapBoxWidgetBuilderModel.fromDynamic(
             {
               'data': data,
               'initialPosition': initialPosition,
               'pins': pins,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: MapBoxWidgetBuilder.kType,
       );

  final dynamic data;

  final dynamic initialPosition;

  final dynamic pins;
}

class MapBoxWidgetBuilderModel extends JsonWidgetBuilderModel {
  const MapBoxWidgetBuilderModel(
    super.args, {
    required this.data,
    required this.initialPosition,
    required this.pins,
  });

  final dynamic data;

  final dynamic initialPosition;

  final dynamic pins;

  static MapBoxWidgetBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[MapBoxWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static MapBoxWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    MapBoxWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is MapBoxWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = MapBoxWidgetBuilderModel(
          args,
          data: map['data'],
          initialPosition: map['initialPosition'],
          pins: map['pins'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'data': data,
      'initialPosition': initialPosition,
      'pins': pins,

      ...args,
    });
  }
}

class MapBoxWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/map_box_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'MapBoxWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'data': SchemaHelper.anySchema,
      'initialPosition': SchemaHelper.anySchema,
      'pins': SchemaHelper.anySchema,
    },
    'required': ['data'],
  };
}
