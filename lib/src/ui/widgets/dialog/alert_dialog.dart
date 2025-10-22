import "package:json_dynamic_widget/json_dynamic_widget.dart";

part "alert_dialog.g.dart";

@jsonWidget
abstract class _AlertDialogBuilder extends JsonWidgetBuilder {
  const _AlertDialogBuilder({required super.args});

  @override
  AlertDialog buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
