import "package:flutter/material.dart";
import "package:syncfusion_flutter_gauges/gauges.dart";

class RadialChart extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final double interval;
  final double width;
  final double height;

  const RadialChart({
    super.key,
    required this.value,
    this.min = 0,
    this.max = 100,
    this.interval = 1.0,
    this.width = 300,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: min,
            maximum: max,
            showLabels: true,
            showTicks: true,
            startAngle: 180,
            endAngle: 0,
            interval: interval,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              thicknessUnit: GaugeSizeUnit.factor,
              color: Colors.grey,
              cornerStyle: CornerStyle.bothCurve,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: value,
                width: 0.2,
                sizeUnit: GaugeSizeUnit.factor,
                color: Colors.green,
                cornerStyle: CornerStyle.bothCurve,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  value.toString(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                angle: 90,
                positionFactor: 0,
              ),
            ],
            labelOffset: 15,
            labelsPosition: ElementsPosition.outside,
            ticksPosition: ElementsPosition.outside,
            minorTicksPerInterval: 0,
            axisLabelStyle: GaugeTextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
