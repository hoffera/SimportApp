import "package:flutter/material.dart";
import "package:mix/mix.dart";

class CardWidget extends StatelessWidget {
  final List<Widget>? children;
  final Widget? header;
  final double? height;
  const CardWidget({
    super.key,
    required this.children,
    this.header,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Box(
        style: Style(
          $box.borderRadius(10),
          $box.width(double.infinity),
          $box.padding(10),
          $box.color(Theme.of(context).colorScheme.surface),
          $box.elevation(1),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [if (header != null) header!, ...children ?? []],
          ),
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final List<Widget>? actions;

  const CardHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: _title(context)),
          _buttons(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(children: actions ?? []);
  }
}
