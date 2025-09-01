import "dart:math";

import "package:json_dynamic_widget/json_dynamic_widget.dart";

part "compass_pointer.g.dart";

@jsonWidget
abstract class _CompassPointerBuilder extends JsonWidgetBuilder {
  const _CompassPointerBuilder({required super.args});

  @override
  CompassPointer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class CompassPointer extends StatelessWidget {
  final double angleDegrees;
  final Color pointerColor;
  final bool arrowOutward;

  const CompassPointer({
    super.key,
    required this.angleDegrees,
    required this.pointerColor,
    required this.arrowOutward,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _pointer(((angleDegrees + 180) % 360) * pi / 180, arrowOutward),
    );
  }

  Widget _pointer(double angleRadians, bool arrowOutward) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: angleRadians,
          alignment: Alignment.center,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: 0,
                child: Container(width: 3, height: 200, color: pointerColor),
              ),

              Positioned(
                bottom: 0,
                child: CustomPaint(
                  size: const Size(30, 30),
                  painter: TrianglePainter(
                    color: pointerColor,
                    arrowOutward: arrowOutward,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool arrowOutward;

  TrianglePainter({required this.color, required this.arrowOutward});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    if (arrowOutward) {
      // Inverte verticalmente
      canvas.translate(0, size.height);
      canvas.scale(1, -1);
    }

    final path = Path();
    path.moveTo(size.width / 2, 0); // topo
    path.lineTo(0, size.height); // canto inferior esquerdo
    path.lineTo(size.width, size.height); // canto inferior direito
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
