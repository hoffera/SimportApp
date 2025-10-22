import "package:flutter/material.dart";
import "package:mix/mix.dart";

class CustomFrame extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? padding;
  final Function()? onPress;

  const CustomFrame({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.width,
    this.height,
    this.padding,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return _box();
  }

  Widget _box() {
    final baseColor = color ?? Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPress,
      child: Box(
        style: Style(
          $box.color(baseColor),
          $box.borderRadius.all(16),
          $box.padding.all(padding ?? 16),
          $box.width(width ?? double.infinity),
          (height != null) ? $box.height(height!) : null,
          $box.border.all(
            color: borderColor ?? const Color(0xFFAEA8A8),
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
