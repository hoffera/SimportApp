import "package:flutter_advanced_drawer/flutter_advanced_drawer.dart";
import "package:get/get_rx/src/rx_types/rx_types.dart";
import "package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/app/components/map_modal/map_modal.dart";
import "package:json_app/app/components/sync/linear_chart/sync_linear_graph.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";
import "package:mix/mix.dart";
import "package:syncfusion_flutter_charts/charts.dart";

class MapLayer {
  final String id;
  final String name;
  RxBool visible;

  MapLayer({required this.id, required this.name, required bool initialVisible})
    : visible = RxBool(initialVisible);
}

class MapPageScreen extends StatefulWidget {
  const MapPageScreen({super.key});

  @override
  State<MapPageScreen> createState() => MapPageScreenState();
}

class MapPageScreenState extends State<MapPageScreen> {
  MapboxMap? mapboxMap;
  final drawerController = AdvancedDrawerController();

  void _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  Future<void> _onStyleLoadedCallback(StyleLoadedEventData data) async {
    if (mapboxMap == null) {
      return;
    }
    await mapboxMap!.style.addSource(
      RasterSource(
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
    );

    await mapboxMap!.style.addSource(
      RasterSource(
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
    );

    await mapboxMap!.style.addSource(
      RasterSource(
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
    );

    await mapboxMap!.style.addSource(
      RasterSource(
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
    );

    await mapboxMap!.style.addSource(
      RasterSource(
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
    );

    await mapboxMap!.style.addLayer(
      RasterLayer(id: "wms-layer-cn-itaqui", sourceId: "wms-source-cn-itaqui"),
    );

    await mapboxMap!.style.addLayer(
      RasterLayer(
        id: "wms-layer-batimetria07",
        sourceId: "wms-source-batimetria07",
      ),
    );
    await mapboxMap!.style.addLayer(
      RasterLayer(id: "wms-layer-berco", sourceId: "wms-source-berco"),
    );
    await mapboxMap!.style.addLayer(
      RasterLayer(id: "wms-layer-poligonal", sourceId: "wms-source-poligonal"),
    );

    await mapboxMap!.style.addLayer(
      RasterLayer(
        id: "wms-layer-batimetria",
        sourceId: "wms-source-batimetria",
      ),
    );
  }

  final layers = <MapLayer>[
    MapLayer(
      id: "wms-layer-cn-itaqui",
      name: "CN_itaqui",
      initialVisible: true,
    ),
    MapLayer(
      id: "wms-layer-batimetria07",
      name: "07_2024_MULTI_B_R1m_PORTO_ITAQUI_REV02",
      initialVisible: true,
    ),
    MapLayer(
      id: "wms-layer-berco",
      name: "simport:Berco_Itaqui",
      initialVisible: true,
    ),
    MapLayer(
      id: "wms-layer-poligonal",
      name: "Poligonal_Porto_Itaqui",
      initialVisible: true,
    ),
    MapLayer(
      id: "wms-layer-batimetria",
      name: "11_2024_MULTI_B_R1m_PORTO_ITAQUI_",
      initialVisible: true,
    ),

    MapLayer(
      id: "FSEFES1",
      name: "11_2024_MULTI_B_R1m_PORTO_ITAQUI_",
      initialVisible: true,
    ),
    MapLayer(
      id: "1FSEFSF",
      name: "11_2024_MULTI_B_R1m_PORTO_ITAQUI_",
      initialVisible: true,
    ),
    MapLayer(
      id: "1FSEFSF",
      name: "11_2024_MULTI_B_R1m_PORTO_ITAQUI_",
      initialVisible: true,
    ),
    MapLayer(
      id: "1FESFSF",
      name: "11_2024_MULTI_B_R1m_PORTO_ITAQUI_",
      initialVisible: true,
    ),
    MapLayer(
      id: "1FFSE",
      name: "11_2024_MULTI_B_R1m_PORTO_ITAQUI_",
      initialVisible: true,
    ),
  ].obs;
  Widget _drawer(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Box(
              style: Style(
                $box.elevation(2),
                $box.borderRadius(20),
                $box.color(AppColors.backgroundDark),
                $box.padding.all(20),
                $box.alignment.center(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final layer in layers)
                    Obx(
                      () => CheckboxListTile(
                        title: Text(
                          layer.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        value: layer.visible.value,
                        activeColor: Colors.green,
                        onChanged: (value) async {
                          layer.visible.value = value!;
                          if (mapboxMap != null) {
                            await mapboxMap!.style.setStyleLayerProperty(
                              layer.id,
                              "visibility",
                              value ? "visible" : "none",
                            );
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: drawerController,
      drawer: _drawer(context),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: AppColors.primary),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      disabledGestures: true,

      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      rtlOpening: true,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 116,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              avatar: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/81923101?v=4",
                ),
              ),
              label: Box(
                style: Style(
                  $text.style.fontSize(10),
                  $text.style.fontWeight.bold(),
                  $text.overflow.ellipsis(),
                  $text.color(Theme.of(context).colorScheme.primary),
                ),
                child: StyledText("Felipe Hoffmeister"),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              labelPadding: const EdgeInsets.only(left: 4),
            ),
          ),
          actions: [
            IconButton(
              icon: HeroIcon(
                HeroIcons.cog,
                size: 24,
                color: Theme.of(context).colorScheme.primary,
              ),

              onPressed: () async {
                // drawerController.showDrawer();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor:
                      Colors.white, // se quiser o modal com cantos arredondados
                  builder: (context) => MapModal(
                    layers: layers,
                    mapboxMap: mapboxMap,
                    title: "Título do Modal",
                    description: "Descrição qualquer",
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SyncLinearGraph(
              height: 500,
              cartesianSeries: [
                SplineRangeAreaSeries<RangeData, DateTime>(
                  name: "seriesName",

                  dataSource: [
                    RangeData(DateTime(2025, 8, 6, 0), 8, 12),
                    RangeData(DateTime(2025, 8, 6, 1), 9, 13),
                    RangeData(DateTime(2025, 8, 6, 2), 18, 20),
                    RangeData(DateTime(2025, 8, 6, 3), 9, 15),
                    RangeData(DateTime(2025, 8, 6, 4), 20, 30),
                    RangeData(DateTime(2025, 8, 6, 5), 9, 13),
                  ],
                  borderColor: Colors.red,
                  color: Colors.red.shade100,

                  xValueMapper: (RangeData data, _) => data.xValue,
                  lowValueMapper: (RangeData data, _) => data.lowValue,
                  highValueMapper: (RangeData data, _) => data.highValue,
                  enableTrackball: true,
                  legendIconType: LegendIconType.diamond,
                  markerSettings: MarkerSettings(isVisible: false),

                  xAxisName: "xAxis",
                ),
              ],
              chartAxis: [],
              chartAxisX: DateTimeAxis(
                name: "xAxis",
                isVisible: true,
                interval: 10,
              ),
            ),

            // MapWidget(
            //   key: const ValueKey("mapWidget"),
            //   styleUri: MapboxStyles.STANDARD,
            //   cameraOptions: CameraOptions(
            //     center: Point(
            //       coordinates: Position(
            //         -44.36719859816095,
            //         -2.5763753959497686,
            //       ),
            //     ),
            //     zoom: 14.0,
            //   ),
            //   onMapCreated: _onMapCreated,
            //   onStyleLoadedListener: _onStyleLoadedCallback,
            // ),
          ],
        ),
      ),
    );
  }
}
