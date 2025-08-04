import "package:expandable_reorderable_list/expandable_reorderable_list.dart";
import "package:flutter/material.dart" hide Icon;
import "package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/presentation/map_page/map_page.screen.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";
import "package:mix/mix.dart";

class MapModal extends StatefulWidget {
  const MapModal({
    super.key,
    required this.title,
    required this.description,
    this.modalHeight = 450,

    this.loading,
    required this.layers,
    this.mapboxMap,
  });

  final String description;
  final bool? loading;
  final double modalHeight;
  final List<MapLayer> layers;
  final MapboxMap? mapboxMap;

  final String title;

  @override
  State<MapModal> createState() => _MapModalState();
}

class _MapModalState extends State<MapModal> {
  late FocusNode _emailFocusNode;
  late double _currentHeight;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _currentHeight = widget.modalHeight;

    _emailFocusNode.addListener(() {
      setState(() {
        _currentHeight = _emailFocusNode.hasFocus
            ? widget.modalHeight + 300
            : widget.modalHeight;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => _emailFocusNode.unfocus(),
          child: Column(
            children: [
              ..._buildHeader(),
              const SizedBox(height: 30),
              ..._buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Box(
        style: Style(
          $text.style.fontSize(18),
          $text.style.fontWeight.w600(),
          $text.color(AppColors.primary),
          $text.textAlign.center(),
        ),
        child: StyledText("Configurações"),
      ),
      const SizedBox(height: 30),
      Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary),
        ),
        child: Scrollbar(
          controller: _scrollController,
          trackVisibility: true,
          child: ExpandableReorderableList<ValueKey<String>>(
            scrollController: _scrollController,

            onReorder: (onReorderParam) {
              setState(() {
                int newIndex = onReorderParam.newIndex;
                if (onReorderParam.oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = widget.layers.removeAt(onReorderParam.oldIndex);
                widget.layers.insert(newIndex, item);
              });
            },
            children: widget.layers.map((layer) {
              return ExpandableReorderableListItem<ValueKey<String>>(
                key: ValueKey<String>(layer.id),
                builder: (_, child, model) {
                  return Obx(
                    () => ReorderableDragStartListener(
                      index: model.index!,
                      child: CheckboxListTile(
                        title: Text(
                          layer.name,
                          style: const TextStyle(color: Colors.black),
                        ),
                        value: layer.visible.value,
                        activeColor: Colors.green,
                        onChanged: (value) async {
                          layer.visible.value = value!;
                          if (widget.mapboxMap != null) {
                            try {
                              await widget.mapboxMap!.style
                                  .setStyleLayerProperty(
                                    layer.id,
                                    "visibility",
                                    value ? "visible" : "none",
                                  );
                            } catch (e) {
                              print(
                                "Erro ao alterar visibilidade da camada ${layer.id}: $e",
                              );
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildHeader() {
    final styles = Style($box.width(60), $box.borderRadius(5));
    return [
      const SizedBox(height: 10),
      Box(
        key: const Key("line-header"),
        style: styles,
        child: Image.asset("assets/images/wave.png"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = bottomInset > 0;

    final modalHeight = isKeyboardOpen
        ? (_emailFocusNode.hasFocus
              ? widget.modalHeight + 300
              : widget.modalHeight)
        : widget.modalHeight;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: double.infinity,
      height: modalHeight,
      child: _buildBody(),
    );
  }
}
