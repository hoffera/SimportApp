import 'dart:math';

import 'package:json_app/components/simport/circular_graph/compass_pointer.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:mix/mix.dart';

part 'circular_graph.g.dart';

@jsonWidget
abstract class _CircularGraphBuilder extends JsonWidgetBuilder {
  const _CircularGraphBuilder({required super.args});

  @override
  CircularGraph buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class CircularGraph extends StatefulWidget {
  final double angleDegrees;
  final String title;
  final Color pointerColor;
  final bool arrowOutward;
  const CircularGraph({
    super.key,
    required this.angleDegrees,
    required this.title,
    required this.pointerColor,
    required this.arrowOutward,
  });

  @override
  State<CircularGraph> createState() => _CircularGraphState();
}

class _CircularGraphState extends State<CircularGraph> {
  OverlayEntry? _tooltipOverlay;

  @override
  Widget build(BuildContext context) {
    return _border();
  }

  Widget _border() {
    return PressableBox(
      onPress: () {
        _showTooltip();
      },
      style: Style(
        $box.width(214),
        $box.height(214),
        $box.shape.circle(),
        $box.alignment.center(),
        $box.elevation(2),
        $box.linearGradient.begin(Alignment.topCenter),
        $box.linearGradient.end(Alignment.bottomCenter),
        $box.linearGradient.colors([
          Colors.white,
          Colors.white,
          Colors.grey[300]!,
        ]),
      ),
      child: _body(),
    );
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Box(
          style: Style(
            $box.width(200),
            $box.height(200),
            $box.shape.circle(
              side: BorderSide(color: Color(0x4D4D89B1), width: 1),
            ),

            $box.alignment.center(),

            $box.linearGradient.begin(Alignment.topCenter),
            $box.linearGradient.end(Alignment.bottomCenter),
            $box.linearGradient.colors([
              Colors.white,
              Colors.white,
              Colors.grey[300]!,
            ]),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _center(),
              _textCircle([' E', 'SE', 'S', 'SW', ' W', 'NW', 'N', 'NE']),
              _tickInterno(40, 0, false),
              _ticksCircle(8, 10, true),
            ],
          ),
        ),

        CompassPointer(
          angleDegrees: widget.angleDegrees,
          pointerColor: widget.pointerColor,
          arrowOutward: widget.arrowOutward,
        ),
        _text(widget.title),
      ],
    );
  }

  Widget _center() {
    return Box(
      style: Style(
        $box.width(180),
        $box.height(180),
        $box.shape.circle(
          side: BorderSide(color: Colors.grey[200]!, width: 0.5),
        ),

        $box.decoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Colors.white,
              Colors.white,
              Colors.grey[200]!,
              Colors.grey[200]!,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }

  Widget _textCircle(final List<String> letters) {
    const double radius = 120;

    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: List.generate(letters.length, (index) {
          final double angle = (2 * pi / letters.length) * index;
          final double x = radius * cos(angle);
          final double y = radius * sin(angle);

          final text = letters[index];
          final double offsetX = text.length == 2 ? 30 : 26;
          final double offsetY = 30;
          final bool isTopOrBottom =
              (angle.abs() < 0.01) || ((angle - pi).abs() < 0.01);

          final double rotationAngle = isTopOrBottom ? 0 : angle + pi / 2;

          return Positioned(
            left: radius + x - offsetX,
            top: radius + y - offsetY,
            child: Transform.rotate(
              angle: rotationAngle,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _text(String text) {
    return Box(
      style: Style(
        $box.width(80),
        $box.height(80),
        $box.elevation(12),
        $box.shape.circle(side: BorderSide(color: Color(0x4D4D89B1), width: 1)),
        $box.decoration(color: Colors.white),
        $box.alignment.center(),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[800]!,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _ticksCircle(int tickCount, int tickLength, bool offset) {
    const double radius = 100;

    return SizedBox(
      width: radius * 2 + tickLength,
      height: radius * 2 + tickLength,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: List.generate(tickCount, (index) {
          final double angle = (2 * pi / tickCount) * index;

          // Coordenadas da borda do círculo
          final double x = radius * cos(angle);
          final double y = radius * sin(angle);

          final double rotationAngle = angle + pi / 2;

          return Positioned(
            left: radius + x - 1.5,
            top: radius + y - 1 - tickLength,
            child: Transform.rotate(
              angle: rotationAngle,
              alignment: offset == true
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              child: Container(width: 1, height: 10, color: Colors.grey[600]),
            ),
          );
        }),
      ),
    );
  }

  Widget _tickInterno(int tickCount, int tickLength, bool offset) {
    const double radius = 100;

    return SizedBox(
      width: radius * 2 + tickLength,
      height: radius * 2 + tickLength,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: List.generate(tickCount, (index) {
          final double angle = (2 * pi / tickCount) * index;
          final double x = radius * cos(angle);
          final double y = radius * sin(angle);

          final double rotationAngle = angle + pi / 2;

          return Positioned(
            left: radius + x - 1.5,
            top: radius + y - 1 - tickLength,
            child: Transform.rotate(
              angle: rotationAngle,
              alignment: offset == true
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              child: Container(width: 1, height: 5, color: Colors.grey[600]),
            ),
          );
        }),
      ),
    );
  }

  void _showTooltip() {
    if (_tooltipOverlay != null) return;

    _tooltipOverlay = _createOverlayEntry();

    Overlay.of(context).insert(_tooltipOverlay!);

    Future.delayed(const Duration(seconds: 2), () {
      _removeTooltip();
    });
  }

  void _removeTooltip() {
    _tooltipOverlay?.remove();
    _tooltipOverlay = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox box = context.findRenderObject() as RenderBox;
    final size = box.size;
    final offset = box.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx + size.width / 2 - 90,
        top: offset.dy + size.height / 2 - 50,
        width: 180,
        height: 30,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 0.9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Direção média: ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.angleDegrees.toStringAsFixed(1)}°',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
