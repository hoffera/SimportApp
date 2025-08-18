import "package:json_app/app/components/maps/map_box_widget/map_box_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

part "map_box_widget_builder.g.dart";

@jsonWidget
abstract class _MapBoxWidgetBuilder extends JsonWidgetBuilder {
  const _MapBoxWidgetBuilder({required super.args});

  @override
  MapBoxWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });

  Map<String, dynamic> mapDynamicToMapStringDynamic(dynamic input) {
    if (input is Map<dynamic, dynamic>) {
      return input.map((key, value) => MapEntry(key.toString(), value));
    }
    throw Exception("Esperado um Map para conversão");
  }

  @JsonArgDecoder("initialPosition")
  Position _decodePosition({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    final lat = value["latitude"];
    final lng = value["longitude"];

    if (lat == null || lng == null) {
      throw Exception("latitude e longitude são obrigatórios");
    }

    return Position(lat as num, lng as num);
  }

  @JsonArgDecoder("pins")
  List<MapPin> _decodePins({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) {
      return [];
    }

    return value.map<MapPin>((item) {
      return MapPin(
        title: item["title"],
        position: Position(item["latitude"], item["longitude"]),
        urlImage: item["urlImage"],
        onTap: () {},
      );
    }).toList();
  }

  @JsonArgDecoder("data")
  List<MapWidgetLayer> _decodeMapWidgetLayer({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) {
      return [];
    }

    return value.map<MapWidgetLayer>((item) {
      if (item is MapWidgetLayer) {
        return item;
      }

      if (item is! Map) {
        throw Exception("Item deve ser Map");
      }

      final Map<String, dynamic> itemMap = mapDynamicToMapStringDynamic(item);

      final rasterLayer = itemMap["rasterLayer"];
      final rasterSource = itemMap["rasterSource"];

      if (rasterLayer == null || rasterSource == null) {
        throw Exception("rasterLayer e rasterSource são obrigatórios");
      }

      final layerId = rasterLayer["id"]?.toString();
      final sourceId = rasterLayer["sourceId"]?.toString();
      final sourceId2 = rasterSource["id"]?.toString();
      final tiles = rasterSource["tiles"] as List<dynamic>?;

      if (layerId == null ||
          sourceId == null ||
          sourceId2 == null ||
          tiles == null) {
        throw Exception("Campos obrigatórios estão null");
      }

      final layer = RasterLayer(id: layerId, sourceId: sourceId);

      final source = RasterSource(
        id: sourceId2,
        tileSize: 256,
        tiles: tiles.cast<String>(),
      );

      return MapWidgetLayer(layer: layer, source: source);
    }).toList();
  }
}
