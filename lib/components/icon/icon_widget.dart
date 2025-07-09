import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:mix/mix.dart';

part 'icon_widget.g.dart';

@jsonWidget
abstract class _IconWidgetBuilder extends JsonWidgetBuilder {
  const _IconWidgetBuilder({required super.args});

  @override
  IconWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class IconWidget extends StatelessWidget {
  final String urlIcon;
  const IconWidget({super.key, required this.urlIcon});

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color.white(),
        $box.borderRadius.all(20),
        $box.padding.all(10),
        $box.height(60),
        $box.width(60),
        $box.elevation(2),
      ),
      child: Image.network(urlIcon, width: 60, height: 60),
    );
  }
}
