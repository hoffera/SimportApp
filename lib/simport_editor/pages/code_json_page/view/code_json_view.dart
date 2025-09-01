import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/simport_editor/pages/code_json_page/controllers/code_json_controller.dart";
import "package:json_app/simport_editor/widgets/code_editor/code_editor_widget.dart";
import "package:json_app/simport_editor/widgets/device_preview/device_preview.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:tab_container/tab_container.dart";
import "package:transformable_list_view/transformable_list_view.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

class CodeJsonPageView extends GetView<CodeJsonController> {
  const CodeJsonPageView({super.key});

  Matrix4 getTransformMatrix(TransformableListItem item) {
    const endScaleBound = 0.3;
    final animationProgress = item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);
      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  PreferredSize _appBar(BuildContext context) {
    final iconSize = 30.0;
    final iconColor = Colors.white;
    double height = 50.0;
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                lighten(AppColors.primary, 0.1),
                lighten(AppColors.primary, 0.2),

                AppColors.primary,
              ],
              durations: [18000, 8000, 12000],
              heightPercentages: [0.70, 0.66, 0.70],
            ),
            backgroundColor: AppColors.primary,
            size: Size(double.infinity, height),
            waveAmplitude: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: SvgPicture.asset(
                "assets/images/simport_logo.svg",
                width: 30,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back, size: iconSize, color: iconColor),
            tooltip: "Voltar",
            onPressed: () {
              context.go("/editor-client/${controller.clientId}");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: _appBar(context),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => CodeEditorWidget(
                  controller: controller.codeController.value,
                  onClear: () {
                    controller.resetControllers();
                  },
                  onFormat: () {
                    final formattedJson = controller.formatJson(
                      controller.codeController.value.text,
                    );
                    controller.codeController.value.text = formattedJson;
                  },
                  onRun: () {
                    if (controller.codeController.value.text.isNotEmpty) {
                      final formattedJson = controller.formatJson(
                        controller.codeController.value.text,
                      );
                      controller.codeController.value.text = formattedJson;
                      final widget = controller.parseWidget(
                        controller.codeController.value.text,
                      );
                      if (widget != null) {
                        controller.parsedWidgets.value = widget;
                        controller.atualizarWidgets([widget]);
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          _tabPage(context),
        ],
      ),
    );
  }

  Widget _tabPage(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabContainer(
            color: Colors.white,
            tabEdge: TabEdge.bottom,
            tabsStart: 0.1,
            tabsEnd: 1.0,
            borderRadius: BorderRadius.circular(20),
            childPadding: const EdgeInsets.all(10.0),
            tabs: _getTabs(),
            selectedTextStyle: const TextStyle(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Comfortaa",
            ),
            unselectedTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Comfortaa",
            ),
            children: _getChildren(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _getTabs() {
    return <Widget>[
      const Text("Original"),
      const Text("Debug"),
      const Text("Skeleton"),
    ];
  }

  List<Widget> _getChildren(BuildContext context) => <Widget>[
    Expanded(
      child: AbsorbPointer(
        child: Center(
          child: DevicePreview(
            screen: Obx(
              () => Scaffold(body: controller.getCurrentWidgets(context)),
            ),
          ),
        ),
      ),
    ),
    Expanded(
      child: Center(
        child: DevicePreview(
          screen: Obx(
            () => Scaffold(body: controller.getDebugWidgets(context)),
          ),
        ),
      ),
    ),
    Expanded(
      child: Center(
        child: DevicePreview(
          screen: Obx(
            () => Scaffold(body: controller.getSkeletonWidgets(context)),
          ),
        ),
      ),
    ),
  ];
}
