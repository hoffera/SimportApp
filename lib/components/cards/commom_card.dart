import 'package:json_app/components/icon/icon_widget.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:mix/mix.dart';

part 'commom_card.g.dart';

@jsonWidget
abstract class _CommomCardBuilder extends JsonWidgetBuilder {
  const _CommomCardBuilder({required super.args});

  @override
  CommomCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class CommomCard extends StatelessWidget {
  final String iconURL;
  final String title;
  final String subtitle;
  const CommomCard({
    super.key,
    required this.iconURL,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconWidget(urlIcon: iconURL),
            SizedBox(width: 10),
            _texts(),
          ],
        ),
      ),
    );
  }

  Widget _texts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StyledText(
          title,
          style: Style(
            $text.style.color.black(),
            $text.style.fontSize(20),
            $text.style.fontWeight(FontWeight.bold),
            $text.strutStyle.fontFamily('Comfortaa'),
          ),
        ),
        StyledText(
          subtitle,
          style: Style(
            $text.style.color.black(),
            $text.style.fontSize(14),
            $text.style.fontWeight(FontWeight.normal),
            $text.strutStyle.fontFamily('Comfortaa'),
          ),
        ),
      ],
    );
  }
}
