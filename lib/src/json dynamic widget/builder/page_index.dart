import "package:json_dynamic_widget/json_dynamic_widget.dart";

part "page_index.g.dart";

@jsonWidget
abstract class _PageIndexBuilder extends JsonWidgetBuilder {
  const _PageIndexBuilder({required super.args});

  @override
  PageIndex buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class PageIndex extends StatelessWidget {
  final List<Widget> children;
  final int index;
  const PageIndex({super.key, required this.children, required this.index});

  @override
  Widget build(BuildContext context) {
    return children[index];
  }
}
