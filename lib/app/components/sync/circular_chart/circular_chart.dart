import "package:flutter/material.dart";
import "package:syncfusion_flutter_gauges/gauges.dart";

class CircularChart extends StatefulWidget {
  final double? height;
  final double angleDegrees;
  final String title;
  final String? subtitle;
  final bool arrowOutward;
  const CircularChart({
    super.key,
    this.height,
    required this.angleDegrees,
    required this.title,
    this.subtitle,
    required this.arrowOutward,
  });

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.biggest.shortestSide;
            final scale = size / 250.0;

            return Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(size / 2),
                ),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        showLabels: false,
                        showTicks: false,
                        startAngle: 0,
                        endAngle: 360,
                        minimum: 0,
                        maximum: 360,
                        axisLineStyle: AxisLineStyle(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 100,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        annotations: [
                          GaugeAnnotation(
                            axisValue: 100,
                            positionFactor: 0,
                            widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.subtitle != null
                                    ? Text(
                                        widget.subtitle!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20 * scale,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40 * scale,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        pointers: [],
                      ),

                      RadialAxis(
                        interval: 15,
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 360,
                        radiusFactor: 1,

                        tickOffset: -10 * scale,
                        showLabels: false,
                        annotations: [],
                        majorTickStyle: MajorTickStyle(
                          length: 10 * scale,
                          thickness: 2 * scale,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        axisLineStyle: AxisLineStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          thickness: 20 * scale,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                        ),
                        minorTicksPerInterval: 0,
                        showTicks: true,
                        canRotateLabels: true,
                        pointers: <GaugePointer>[],
                      ),

                      RadialAxis(
                        interval: 45,
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 360,
                        radiusFactor: 1,

                        showLabels: false,
                        axisLabelStyle: GaugeTextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 18 * scale,
                        ),
                        axisLineStyle: AxisLineStyle(
                          color: Colors.transparent,
                          thickness: 20 * scale,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                        ),
                        minorTicksPerInterval: 5,
                        showTicks: false,
                        canRotateLabels: true,
                        annotations: _buildNumberLabels(scale),
                        pointers: <GaugePointer>[],
                      ),

                      RadialAxis(
                        interval: 15,
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 360,
                        radiusFactor: 0.85,
                        showLabels: false,
                        showTicks: true,
                        minorTicksPerInterval: 0,
                        tickOffset: -10 * scale,
                        ticksPosition: ElementsPosition.outside,
                        majorTickStyle: MajorTickStyle(
                          length: 8 * scale,
                          thickness: 2 * scale,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        axisLineStyle: AxisLineStyle(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 20 * scale,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                        ),
                      ),

                      RadialAxis(
                        interval: 45,
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 360,
                        radiusFactor: 0.85,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          color: Colors.transparent,
                          thickness: 20 * scale,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                        ),
                        annotations: _buildDirectionalLabels(scale),
                        pointers: <GaugePointer>[],
                      ),

                      RadialAxis(
                        interval: 45,
                        startAngle: 0,
                        endAngle: 360,
                        minimum: 0,
                        maximum: 360,
                        radiusFactor: 0.85,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          color: Colors.transparent,
                          thickness: 20 * scale,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                        ),
                        pointers: <GaugePointer>[
                          MarkerPointer(
                            markerOffset: 8 * scale,
                            color: Theme.of(
                              context,
                            ).colorScheme.tertiaryContainer,
                            value: widget.angleDegrees,
                            markerHeight: 30 * scale,
                            markerWidth: 30 * scale,
                            elevation: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<GaugeAnnotation> _buildNumberLabels(double scale) {
    final labels = {
      0: "90",
      45: "135",
      90: "180",
      135: "225",
      180: "270",
      225: "315",
      270: "0",
      315: "45",
    };

    return labels.entries.map((entry) {
      final angleInRadians = (entry.key - 270) * (3.14159265359 / 180);
      return GaugeAnnotation(
        angle: entry.key.toDouble(),
        positionFactor: 1,
        widget: Transform.rotate(
          angle: angleInRadians,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5 * scale),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10 * scale),
            ),
            child: Text(
              entry.value,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14 * scale,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<GaugeAnnotation> _buildDirectionalLabels(double scale) {
    final labels = {
      0: "N",
      45: "NE",
      90: "E",
      135: "SE",
      180: "S",
      225: "SW",
      270: "N",
      315: "NW",
    };

    return labels.entries.map((entry) {
      final angleInRadians = (entry.key - 270) * (3.14159265359 / 180);
      return GaugeAnnotation(
        angle: entry.key.toDouble(),
        positionFactor: 1,
        widget: Transform.rotate(
          angle: angleInRadians,
          child: Container(
            height: 22 * scale,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              entry.value,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 14 * scale,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
