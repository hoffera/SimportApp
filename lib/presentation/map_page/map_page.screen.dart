import "package:json_app/app/components/map/map_box_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

class MapPageScreen extends StatefulWidget {
  const MapPageScreen({super.key});

  @override
  State<MapPageScreen> createState() => MapPageScreenState();
}

class MapPageScreenState extends State<MapPageScreen> {
  MapboxMap? mapboxMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapBoxWidget(
        data: [
          MapWidgetLayer(
            source: RasterSource(
              id: "wms-source-cn-itaqui",
              tileSize: 256,
              tiles: [
                "https://gis.appix.com.br/geoserver/simport/wms"
                    "?service=WMS"
                    "&version=1.1.1"
                    "&request=GetMap"
                    "&layers=simport:CN_itaqui"
                    "&styles="
                    "&format=image/png"
                    "&transparent=true"
                    "&srs=EPSG:3857"
                    "&bbox={bbox-epsg-3857}"
                    "&width=256"
                    "&height=256",
              ],
            ),
            layer: RasterLayer(
              id: "wms-layer-cn-itaqui",
              sourceId: "wms-source-cn-itaqui",
            ),
          ),
          MapWidgetLayer(
            source: RasterSource(
              id: "wms-source-batimetria07",
              tileSize: 256,
              tiles: [
                "https://gis.appix.com.br/geoserver/batimetria/wms"
                    "?service=WMS"
                    "&request=GetMap"
                    "&version=1.1.1"
                    "&layers=batimetria:07_2024_MULTI_B_R1m_PORTO_ITAQUI_REV02"
                    "&styles="
                    "&format=image/png"
                    "&transparent=true"
                    "&srs=EPSG:3857"
                    "&bbox={bbox-epsg-3857}"
                    "&width=256"
                    "&height=256",
              ],
            ),
            layer: RasterLayer(
              id: "wms-layer-batimetria07",
              sourceId: "wms-source-batimetria07",
            ),
          ),
          MapWidgetLayer(
            source: RasterSource(
              id: "wms-source-berco",
              tileSize: 256,
              tiles: [
                "https://gis.appix.com.br/geoserver/simport/wms"
                    "?service=WMS"
                    "&version=1.1.1"
                    "&request=GetMap"
                    "&layers=simport:Berco_Itaqui"
                    "&styles="
                    "&format=image/png"
                    "&transparent=true"
                    "&srs=EPSG:3857"
                    "&bbox={bbox-epsg-3857}"
                    "&width=256"
                    "&height=256",
              ],
            ),
            layer: RasterLayer(
              id: "wms-layer-berco",
              sourceId: "wms-source-berco",
            ),
          ),
          MapWidgetLayer(
            source: RasterSource(
              id: "wms-source-poligonal",
              tileSize: 256,
              tiles: [
                "https://gis.appix.com.br/geoserver/simport/wms"
                    "?service=WMS"
                    "&version=1.1.1"
                    "&request=GetMap"
                    "&layers=simport:Poligonal_Porto_Itaqui"
                    "&styles="
                    "&format=image/png"
                    "&transparent=true"
                    "&srs=EPSG:3857"
                    "&bbox={bbox-epsg-3857}"
                    "&width=256"
                    "&height=256",
              ],
            ),
            layer: RasterLayer(
              id: "wms-layer-poligonal",
              sourceId: "wms-source-poligonal",
            ),
          ),
          MapWidgetLayer(
            source: RasterSource(
              id: "wms-source-batimetria",
              tileSize: 256,
              minzoom: 10,
              maxzoom: 20,
              tiles: [
                "https://gis.appix.com.br/geoserver/batimetria/wms"
                    "?service=WMS"
                    "&version=1.1.1"
                    "&request=GetMap"
                    "&layers=batimetria:11_2024_MULTI_B_R1m_PORTO_ITAQUI_"
                    "&styles="
                    "&format=image/png"
                    "&transparent=true"
                    "&srs=EPSG:3857"
                    "&bbox={bbox-epsg-3857}"
                    "&width=256"
                    "&height=256",
              ],
            ),
            layer: RasterLayer(
              id: "wms-layer-batimetria",
              sourceId: "wms-source-batimetria",
            ),
          ),
        ],
      ),
    );
  }
}
