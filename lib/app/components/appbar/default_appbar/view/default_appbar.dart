import "package:heroicons/heroicons.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

part "default_appbar.g.dart";

@jsonWidget
abstract class _DefaultAppBarBuilder extends JsonWidgetBuilder {
  const _DefaultAppBarBuilder({required super.args});

  @override
  DefaultAppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String url;
  final String name;
  final String? title;

  const DefaultAppBar({
    super.key,
    required this.url,
    required this.name,
    this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 116,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActionChip(
          onPressed: () => Scaffold.of(context).openDrawer(),
          avatar: CircleAvatar(radius: 30, backgroundImage: NetworkImage(url)),
          label: Box(
            style: Style(
              $text.style.fontSize(10),
              $text.style.fontWeight.bold(),
              $text.overflow.ellipsis(),
              $text.color(Theme.of(context).colorScheme.primary),
            ),
            child: StyledText(name),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          labelPadding: const EdgeInsets.only(left: 4),
        ),
      ),
      centerTitle: true,
      title: title != null
          ? Box(
              style: Style(
                $text.style.fontSize(16),
                $text.style.letterSpacing(1),
                $text.overflow.clip(),
                $text.color(Theme.of(context).colorScheme.primary),
              ),
              child: StyledText(title!.toUpperCase()),
            )
          : null,
      actions: <Widget>[
        IconButton(
          icon: HeroIcon(
            HeroIcons.arrowPath,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () async {
            //adicionar refresh
            //adicionar refresh
          },
        ),
        IconButton(
          icon: HeroIcon(
            HeroIcons.bell,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: 8),
    );
  }
}
