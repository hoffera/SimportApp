import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

part "title_widget.g.dart";

@jsonWidget
abstract class _TitleWidgetBuilder extends JsonWidgetBuilder {
  const _TitleWidgetBuilder({required super.args});

  @override
  TitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return StyledText(
      title,
      style: Style(
        $text.style.color(Theme.of(context).colorScheme.primary),
        $text.style.fontSize(30),
        $text.style.fontWeight(FontWeight.w700),
      ),
    );
  }
}
