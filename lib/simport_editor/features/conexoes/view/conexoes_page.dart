import "dart:convert";

import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:graphite/graphite.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/app/models/curinga/curinga_service.dart";
import "package:json_app/main.dart";
import "package:json_app/simport_editor/features/conexoes/bloc/conexoes_page_cubit.dart";
import "package:json_app/simport_editor/services/conexoes_services.dart";
import "package:json_app/simport_editor/widgets/device_preview/device_preview.dart";
import "package:json_app/simport_editor/widgets/menu/horizontal_menu.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:patterns_canvas/patterns_canvas.dart";

class ConexoesPage extends StatefulWidget {
  final String clientId;
  const ConexoesPage({super.key, required this.clientId});

  @override
  State<ConexoesPage> createState() => _ConexoesPageState();
}

class _ConexoesPageState extends State<ConexoesPage> {
  final ConexoesPageCubit conexoesPageCubit = ConexoesPageCubit();
  final ConexoesService conexoesService = ConexoesService();
  final TransformationController transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    conexoesPageCubit.onInit(widget.clientId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConexoesPageCubit, ConexoesPageStates>(
      bloc: conexoesPageCubit,
      builder: (context, state) {
        if (state is ConexoesPageLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ConexoesPageSuccess) {
          return _sucessStateWidget(state);
        } else if (state is ConexoesPageError) {
          return Center(child: Text(state.error));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _sucessStateWidget(ConexoesPageSuccess state) {
    return CustomPaint(
      size: Size(double.infinity, double.infinity),
      painter: MyPainter(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                InteractiveViewer(
                  transformationController: transformationController,
                  constrained: false,
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  minScale: 0.01,
                  maxScale: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DirectGraph(
                      list: state.nodes,

                      defaultCellSize: const Size(1.0, 1.0),
                      cellPadding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      orientation: MatrixOrientation.Horizontal,
                      clipBehavior: Clip.none,
                      centered: true,
                      styleBuilder: (edge) {
                        return EdgeStyle(
                          arrowType: EdgeArrowType.one,
                          linePaint: Paint()
                            ..color = AppColors.primary
                            ..strokeWidth = 2.0
                            ..style = PaintingStyle.stroke,
                        );
                      },
                      nodeBuilder: (BuildContext context, NodeInput node) {
                        final pageId = int.tryParse(node.id);

                        return FutureBuilder<Widget>(
                          future: _scaffoldJson(context, pageId, 6),
                          builder: (context, snapshot) {
                            return snapshot.data ?? _deviceFrame(context);
                          },
                        );
                      },
                    ),
                  ),
                ),

                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: HorizontalMenu(
                      client: state.client,
                      onCenterTap: () {
                        transformationController.value = Matrix4.identity();
                      },
                      onZoomInTap: () {
                        const double zoomInFactor = 1.2;
                        final currentMatrix = transformationController.value
                            .clone();
                        currentMatrix.scale(zoomInFactor);
                        transformationController.value = currentMatrix;
                      },
                      onZoomOutTap: () {
                        const double zoomOutFactor = 1.2;
                        final currentMatrix = transformationController.value
                            .clone();
                        currentMatrix.scale(1 / zoomOutFactor);
                        transformationController.value = currentMatrix;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _deviceFrame(BuildContext context) {
    return DevicePreview(
      screen: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }

  Future<Widget> _scaffoldJson(
    BuildContext context,
    int? pageID,
    int principal,
  ) async {
    if (pageID == null) {
      return const SizedBox.shrink();
    }
    final scaffoldData = await conexoesService.loadScaffold(pageID, registry);

    return RepaintBoundary(
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "ID: ${pageID.toString()}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.contentColorBlack,
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: () async {
                try {
                  final json = await conexoesService.loadJson(pageID);
                  final jsondata = await CuringaService.replaceCuringa(json);
                  if (context.mounted) {
                    final bytes = utf8.encode(jsondata);
                    final base64Json = base64.encode(bytes);
                    context.go("/code-json/$base64Json/${widget.clientId}");
                  }
                } catch (e) {
                  print("DEBUG: Error loading JSON: $e");
                }
              },
              child: AbsorbPointer(
                child: DevicePreview(
                  screen:
                      scaffoldData?.build(context: context) ??
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Pattern pattern = Dots(
      bgColor: AppColors.contentColorWhite,
      fgColor: Colors.grey.withOpacity(0.3),
      featuresCount: 200,
    );

    pattern.paintOnRect(canvas, size, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
