// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:skeletonizer/skeletonizer.dart";

part "skeletonizer_builder.g.dart";

@jsonWidget
abstract class _SkeletonLoadingBuilder extends JsonWidgetBuilder {
  const _SkeletonLoadingBuilder({required super.args});

  @override
  SkeletonLoading buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class SkeletonLoading extends StatelessWidget {
  final Widget child;
  const SkeletonLoading({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        duration: Duration(seconds: 1),
      ),
      enabled: true,
      child: child,
    );
  }
}
