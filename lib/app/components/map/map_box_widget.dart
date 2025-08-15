import "package:flutter/material.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

class MapWidgetLayer {
  final RasterSource source;
  final RasterLayer layer;

  MapWidgetLayer({required this.source, required this.layer});
}

class MapBoxWidget extends StatefulWidget {
  final List<MapWidgetLayer> data;

  const MapBoxWidget({super.key, required this.data});

  @override
  State<MapBoxWidget> createState() => _MapBoxWidgetState();
}

class _MapBoxWidgetState extends State<MapBoxWidget> {
  MapboxMap? mapboxMap;

  void _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  Future<void> _onStyleLoadedCallback(StyleLoadedEventData data) async {
    if (mapboxMap == null) return;

    try {
      for (final item in widget.data) {
        await mapboxMap!.style.addSource(item.source);
      }

      for (final item in widget.data) {
        await mapboxMap!.style.addLayer(item.layer);
      }
    } catch (e) {
      debugPrint("Erro ao carregar layers: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      key: ValueKey("mapWidget"),
      styleUri: MapboxStyles.STANDARD,
      cameraOptions: CameraOptions(
        center: Point(
          coordinates: Position(-44.36719859816095, -2.5763753959497686),
        ),
        zoom: 14.0,
      ),
      onMapCreated: _onMapCreated,
      onStyleLoadedListener: _onStyleLoadedCallback,
    );
  }
}
