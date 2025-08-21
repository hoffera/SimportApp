import "package:device_frame/device_frame.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:graphite/graphite.dart";
import "package:json_app/app/client/client_model.dart";
import "package:json_app/app/components/cards/home_card.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:tab_container/tab_container.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

import "../controllers/editor_client_page_controller.dart";

class EditorClientPageView extends GetView<EditorClientPageController> {
  const EditorClientPageView({super.key, required this.clientId});

  final String clientId;

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  Widget _simportLogo() {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                lighten(AppColors.primary, 0.2),
                lighten(AppColors.primary, 0.1),
                AppColors.primary,
              ],
              durations: [10000, 12000, 11000],
              heightPercentages: [0.7, 0.75, 0.80],
            ),
            backgroundColor: AppColors.primary,
            size: Size(double.infinity, 180),
            waveAmplitude: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SvgPicture.asset(
                "assets/images/simport_logo.svg",
                width: 50,
                height: 50,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeCard(Client client, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: HomeCard(
        title: client.nome ?? "",
        subtitle: client.identificacao ?? "",
        logo: client.logo,
        onTap: () {
          if (controller.clientId != client.id) {
            context.go("/editor-client/${client.id}");
          }
        },
      ),
    );
  }

  Widget _tabPage(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: TabContainer(
            color: Colors.white,
            tabEdge: TabEdge.bottom,
            tabsStart: 0.1,
            tabsEnd: 0.5,
            borderRadius: BorderRadius.circular(20),
            childPadding: const EdgeInsets.all(10.0),
            tabs: _getTabs(),
            selectedTextStyle: const TextStyle(
              color: AppColors.primary,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Comfortaa",
            ),
            unselectedTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Comfortaa",
            ),
            children: _getChildren(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _getChildren(BuildContext context) => <Widget>[
    _telasInclusas(context),
    _telasDoCliente(context),
  ];

  List<Widget> _getTabs() {
    return <Widget>[
      const Text("Telas integradas"),
      const Text("Telas do Cliente"),
    ];
  }

  Widget _menu(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _simportLogo(),
          const SizedBox(height: 50),
          Obx(() {
            if (controller.client.value == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: HomeCard(
                  title: controller.client.value!.nome!,
                  subtitle: controller.client.value!.identificacao!,
                  logo: controller.client.value!.logo!,
                  onTap: () {},
                ),
              ),
            );
          }),
          const SizedBox(height: 50),
          Expanded(
            child: Obx(() {
              final RxBool isClientsExpanded = false.obs;

              if (controller.clients.isEmpty) {
                return const SizedBox.shrink();
              }

              return Container(
                decoration: BoxDecoration(color: AppColors.primary),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        isClientsExpanded.value = !isClientsExpanded.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.people, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              "CLIENTES",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Comfortaa",
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => Icon(
                                isClientsExpanded.value
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      return AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: SizedBox(
                          height: 500,
                          child: ListView(
                            children: controller.clients
                                .map((client) => _homeCard(client, context))
                                .toList(),
                          ),
                        ),
                        crossFadeState: isClientsExpanded.value
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 100),
                        firstCurve: Curves.easeInOut,
                        secondCurve: Curves.easeInOut,
                      );
                    }),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _menuTelasInclusas(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,

        child: Column(
          spacing: 0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
            const SizedBox(height: 50),
            ListTile(
              title: Text(
                "Resetar zoom",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
              leading: Icon(Icons.youtube_searched_for_sharp, size: 30),
              onTap: () {
                controller.resetView();
              },
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _menuTelasDoCliente(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,

        child: Column(
          spacing: 0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
            const SizedBox(height: 50),
            ListTile(
              title: Text(
                "Adicionar página",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
              leading: Icon(Icons.add, size: 30),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Remover página",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
              leading: Icon(Icons.remove, size: 30),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Editar principal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
              leading: Icon(Icons.edit, size: 30),
              onTap: () {},
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _telasInclusas(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    controller.graphUpdated.value;
                    if (controller.nodes.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text("Carregando gráfico..."),
                          ],
                        ),
                      );
                    }

                    return InteractiveViewer(
                      transformationController:
                          controller.transformationController,
                      constrained: false,
                      boundaryMargin: const EdgeInsets.all(double.infinity),
                      minScale: 0.1,
                      maxScale: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DirectGraph(
                          list: controller.nodes,

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

                            return _scaffoldJson(context, pageId, 6);
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),

          _menuTelasInclusas(context),
        ],
      ),
    );
  }

  Widget _telasDoCliente(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.client.value == null) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text("Carregando gráfico..."),
                    ],
                  ),
                );
              }

              final views = controller.client.value!.views ?? [];

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: views
                        .map(
                          (page) => Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: SizedBox(
                              height: 500,
                              width: 500,
                              child: _scaffoldJson(context, page.id, 6),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            }),
          ),
          _menuTelasDoCliente(context),
        ],
      ),
    );
  }

  Widget _scaffoldJson(BuildContext context, int? pageID, int principal) {
    if (pageID == null) {
      return const SizedBox.shrink();
    }

    return RepaintBoundary(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: pageID == principal
                  ? Text(
                      "PRINCIPAL \nPágina ID: ${pageID.toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "Página ID: ${pageID.toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: () async {
                try {
                  final json = await controller.loadJson(pageID);
                  if (context.mounted) {
                    context.go(
                      "/code-json?json=${Uri.encodeComponent(json)}&clientId=$clientId",
                    );
                  }
                } catch (e) {
                  print("DEBUG: Error loading JSON: $e");
                }
              },
              child: AbsorbPointer(
                child: DeviceFrame(
                  device: Devices.android.samsungGalaxyS25,
                  screen: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(kToolbarHeight),
                      child: FutureBuilder<JsonWidgetData>(
                        future: controller.loadAppBar(
                          pageID,
                          controller.registry,
                        ),
                        builder: (context, appBarSnapshot) {
                          if (appBarSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (appBarSnapshot.hasData &&
                              appBarSnapshot.data != null) {
                            return PreferredSize(
                              preferredSize: Size.fromHeight(kToolbarHeight),
                              child: appBarSnapshot.data!.build(
                                context: context,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    body: FutureBuilder<JsonWidgetData>(
                      future: controller.loadBody(pageID, controller.registry),
                      builder: (context, bodySnapshot) {
                        if (bodySnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (bodySnapshot.hasData && bodySnapshot.data != null) {
                          return bodySnapshot.data!.build(context: context);
                        }
                        return const Center(child: Text("Sem dados"));
                      },
                    ),
                    bottomNavigationBar: FutureBuilder<JsonWidgetData>(
                      future: controller.loadBottomNavigationBar(
                        pageID,
                        controller.registry,
                      ),
                      builder: (context, bottomNavSnapshot) {
                        if (bottomNavSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox.shrink();
                        }
                        if (bottomNavSnapshot.hasData &&
                            bottomNavSnapshot.data != null) {
                          return bottomNavSnapshot.data!.build(
                            context: context,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Row(children: [_menu(context), _tabPage(context)]),
    );
  }
}
