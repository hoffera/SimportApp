import "package:get/get.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

import "../controllers/dynamic_json_page_controller.dart";

class DynamicJsonPageView extends GetView<DynamicJsonPageController> {
  const DynamicJsonPageView({
    super.key,
    required this.pageID,
    required this.skeleton,
  });

  final int pageID;
  final JsonWidgetData skeleton;

  Widget _scaffoldJson(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.scaffoldData.value?.build(context: context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final content = controller.scaffoldData.value != null
          ? _scaffoldJson(context)
          : skeleton.build(context: context);

      return AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return child;
        },
        child: KeyedSubtree(
          key: ValueKey(controller.scaffoldData.value?.hashCode ?? 0),
          child: content,
        ),
      );
    });
  }
}
