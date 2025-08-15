import "dart:ui" as ui;

import "package:http/http.dart" as http;
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

class MapWidgetLayer {
  final RasterSource source;
  final RasterLayer layer;

  MapWidgetLayer({required this.source, required this.layer});
}

class MapPin {
  final String urlImage;
  final String title;
  final Position position;

  final Function() onTap;

  MapPin({
    required this.urlImage,
    required this.onTap,
    required this.title,
    required this.position,
  });
}

class MapBoxWidget extends StatefulWidget {
  final List<MapWidgetLayer> data;
  final Position? initialPosition;
  final List<MapPin>? pins;
  const MapBoxWidget({
    super.key,
    required this.data,
    this.initialPosition,
    this.pins,
  });

  @override
  State<MapBoxWidget> createState() => _MapBoxWidgetState();
}

class _MapBoxWidgetState extends State<MapBoxWidget> {
  MapboxMap? mapboxMap;
  PointAnnotationManager? pointAnnotationManager;
  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    mapboxMap.attribution.updateSettings(AttributionSettings(enabled: false));
  }

  Future<Uint8List> imageUrlToUint8List(String imageUrl) async {
    try {
      http.Response response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        final codec = await ui.instantiateImageCodec(
          response.bodyBytes,
          targetWidth: 64,
          targetHeight: 64,
        );

        final frame = await codec.getNextFrame();
        final data = await frame.image.toByteData(
          format: ui.ImageByteFormat.png,
        );

        return data!.buffer.asUint8List();
      } else {
        throw Exception("Falha ao carregar imagem: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Erro ao carregar imagem: $e");
      rethrow;
    }
  }

  Future<void> _onStyleLoadedCallback(StyleLoadedEventData data) async {
    if (mapboxMap == null) {
      debugPrint("MapboxMap is null");
      return;
    }

    try {
      for (final item in widget.data) {
        await mapboxMap!.style.addSource(item.source);
      }

      for (final item in widget.data) {
        await mapboxMap!.style.addLayer(item.layer);
      }

      pointAnnotationManager = await mapboxMap!.annotations
          .createPointAnnotationManager();

      for (final item in widget.pins ?? []) {
        Uint8List bytes = await imageUrlToUint8List(item.urlImage);
        final Uint8List imageData = bytes.buffer.asUint8List();
        PointAnnotationOptions pointAnnotationOptions = PointAnnotationOptions(
          geometry: Point(coordinates: item.position),
          image: imageData,

          textAnchor: TextAnchor.BOTTOM,
          textOffset: [0, 2.0],
          textField: item.title,
          iconSize: 1.0,
          isDraggable: false,
        );
        pointAnnotationManager?.create(pointAnnotationOptions);
      }
      pointAnnotationManager!.tapEvents(
        onTap: (annotation) {
          for (final item in widget.pins ?? []) {
            if (item.title == annotation.textField) {
              item.onTap();
            }
          }
        },
      );
    } catch (e) {
      debugPrint("Erro ao carregar layers: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      key: ValueKey("mapWidget"),
      styleUri: MapboxStyles.STANDARD,
      textureView: true,
      cameraOptions: CameraOptions(
        center: Point(
          coordinates:
              widget.initialPosition ??
              Position(-44.36719859816095, -2.5763753959497686),
        ),
        zoom: 14.0,
      ),

      onMapCreated: _onMapCreated,
      onStyleLoadedListener: _onStyleLoadedCallback,
    );
  }
}
