import "package:flutter/material.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import "package:widgetbook/widgetbook.dart";

extension SinglePlotBandKnob on KnobsBuilder {
  PlotBand singlePlotBand({
    required BuildContext context,
    required String groupName,
    required start,
    required end,
    required angle,
    required text,
    required color,
    required horizontalTextAlignment,
    required fontSize,
    required textColor,
  }) {
    return PlotBand(
      isVisible: true,
      start: start,
      end: end,
      color: color,
      text: text,
      textAngle: angle,
      horizontalTextAlignment: horizontalTextAlignment,
      textStyle: TextStyle(fontSize: fontSize, color: textColor),
    );
  }
}

extension TextAnchorKnobs on KnobsBuilder {
  TextAnchor horizontalTextAlignmentKnob({
    String label = "Horizontal Text Alignment",
    String? description,
    TextAnchor initial = TextAnchor.start,
  }) {
    return list<TextAnchor>(
      label: label,
      description: description,
      options: TextAnchor.values,
      initialOption: initial,
      labelBuilder: (value) {
        return value.toString().split(".").last; // Exibe só o nome, ex: 'start'
      },
    );
  }
}
