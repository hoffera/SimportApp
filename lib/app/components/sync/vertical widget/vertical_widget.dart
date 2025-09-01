import "package:flutter/material.dart";

class VerticalWidget extends StatefulWidget {
  final Widget child;
  const VerticalWidget({super.key, required this.child});

  static void show(BuildContext context, {required Widget child}) {
    showDialog(
      context: context,

      builder: (BuildContext context) => FullScreenVerticalDialog(child: child),
    );
  }

  @override
  State<VerticalWidget> createState() => _VerticalWidgetState();
}

class _VerticalWidgetState extends State<VerticalWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotatedBox(quarterTurns: 3, child: widget.child),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.close, size: 24),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}

class FullScreenVerticalDialog extends StatelessWidget {
  final Widget child;

  const FullScreenVerticalDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: VerticalWidget(child: child),
      ),
    );
  }
}
