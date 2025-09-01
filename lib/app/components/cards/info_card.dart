import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, this.unit, required this.title, this.subtitle});

  final String? subtitle;
  final String title;
  final String? unit;

  Widget body() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(), _subtitle()],
      ),
    );
  }

  Widget _title() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StyledText(
          title,
          style: Style(
            $text.style.color.black(),
            $text.style.fontSize(30),
            $text.style.fontWeight(FontWeight.bold),
            $text.style.fontFamily("Comfortaa"),
          ),
        ),
        unit != null
            ? StyledText(
                unit!,
                style: Style(
                  $text.style.color.black(),
                  $text.style.fontSize(14),
                  $text.style.fontWeight(FontWeight.normal),
                  $text.style.fontFamily("Comfortaa"),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget _subtitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        subtitle != null
            ? StyledText(
                subtitle!,
                style: Style(
                  $text.style.color.black(),
                  $text.style.fontSize(12),
                  $text.style.fontWeight(FontWeight.bold),
                  $text.style.fontFamily("Comfortaa"),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
