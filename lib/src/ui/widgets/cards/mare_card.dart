import "dart:math";

import "package:json_app/src/ui/widgets/custom_typography/custom_typography.dart";
import "package:json_app/src/utils/enum/enum.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

part "mare_card.g.dart";

@jsonWidget
abstract class _MareCardBuilder extends JsonWidgetBuilder {
  const _MareCardBuilder({required super.args});

  @override
  MareCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class MareCard extends StatelessWidget {
  const MareCard({super.key});
  @override
  Widget build(BuildContext context) {
    return _card(context);
  }

  Widget _card(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: 150,
      width: 200,
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _wave(context)),
        Positioned.fill(child: _dashedLine(context)),
        Positioned(bottom: 15, left: 28, child: _cardTitleWithCircle(context)),
      ],
    );
  }

  Widget _cardTitleWithCircle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _textTime(context),
        SizedBox(height: 4),
        _circle(context),
        SizedBox(height: 2),
        _textInfo(context),
      ],
    );
  }

  Widget _textInfo(BuildContext context) {
    return Center(
      child: CustomTypography(
        variant: TypoVariant.h7,
        text: "1.43",
        weight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        align: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _textTime(BuildContext context) {
    return Center(
      child: CustomTypography(
        variant: TypoVariant.h7,
        text: "10:00",
        weight: FontWeight.w900,
        color: Theme.of(context).colorScheme.onSurface,
        align: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _circle(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,

            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _wave(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: CustomPaint(painter: SineWavePainter(context: context)),
    );
  }

  Widget _dashedLine(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: CustomPaint(painter: DashedLinePainter(context: context)),
    );
  }
}

class SineWavePainter extends CustomPainter {
  final BuildContext context;
  SineWavePainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (double x = 0; x <= size.width; x++) {
      double y = size.height / 2 + 40 * sin(2 * pi * x / size.width);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedLinePainter extends CustomPainter {
  final BuildContext context;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter({
    required this.context,
    this.dashWidth = 2,
    this.dashSpace = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.onSurface
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double y = size.height / 2;
    double startX = 0;

    while (startX < size.width) {
      final endX = (startX + dashWidth < size.width)
          ? startX + dashWidth
          : size.width;
      canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
