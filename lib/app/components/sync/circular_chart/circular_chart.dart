import "dart:async";

import "package:flutter/material.dart";
import "package:json_app/app/enum/enum.dart";
import "package:syncfusion_flutter_gauges/gauges.dart";

class CircularChart extends StatefulWidget {
  final double? height;
  const CircularChart({super.key, this.height});

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  int _currentIndex = 0;
  double _markerValue = 0;
  List<double> angleSequence = [0, 45, 90, 135, 180, 225, 270, 315];

  @override
  void initState() {
    super.initState();
    _startMarkerAnimation();
  }

  void _startMarkerAnimation() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _markerValue = angleSequence[_currentIndex];
        _currentIndex = (_currentIndex + 1) % angleSequence.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest.shortestSide;
          final scale = size / 400.0;

          return Center(
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
                      color: AppColors.primary,
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
                            Text(
                              "De",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20 * scale,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Se",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40 * scale,
                                color: Colors.white,
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
                    labelOffset: -10 * scale,
                    tickOffset: -15 * scale,
                    showLabels: false,
                    majorTickStyle: MajorTickStyle(
                      length: 10 * scale,
                      thickness: 2 * scale,
                      color: AppColors.primary,
                    ),
                    axisLineStyle: AxisLineStyle(
                      color: Colors.white,
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
                    labelOffset: -10 * scale,
                    tickOffset: -10 * scale,
                    axisLabelStyle: GaugeTextStyle(
                      color: AppColors.primary,
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
                    radiusFactor: 0.9,
                    showLabels: false,
                    showTicks: true,
                    minorTicksPerInterval: 0,
                    tickOffset: -10 * scale,
                    majorTickStyle: MajorTickStyle(
                      length: 8 * scale,
                      thickness: 2 * scale,
                      color: Colors.white,
                    ),
                    axisLineStyle: AxisLineStyle(
                      color: AppColors.primary,
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
                    radiusFactor: 0.9,
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
                    radiusFactor: 0.9,
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
                        color: const Color(0xFFFFFF33),
                        value: _markerValue,
                        markerHeight: 30 * scale,
                        markerWidth: 30 * scale,
                        elevation: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
            padding: EdgeInsets.symmetric(horizontal: 2 * scale),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6 * scale),
            ),
            child: Text(
              entry.value,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 15 * scale,
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
      270: "W",
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
            padding: EdgeInsets.symmetric(vertical: scale),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6 * scale),
            ),
            child: Text(
              entry.value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15 * scale,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
