import "package:flutter/material.dart";
import "package:json_app/app/components/sync/radial_chart/radial_chart.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart";
import "package:widgetbook/widgetbook.dart";

@UseCase(name: "Gráfico: Radial", type: RadialChart)
Widget buildRadialChartUseCase(BuildContext context) {
  final valor = context.knobs.double.input(label: "Valor", initialValue: 3);
  final minimo = context.knobs.double.input(label: "Mínimo", initialValue: 0);
  final maximo = context.knobs.double.input(label: "Máximo", initialValue: 5);
  final interval = context.knobs.double.input(
    label: "Intervalo",
    initialValue: 1,
  );
  final altura = context.knobs.double.input(
    label: "Altura do gráfico",
    initialValue: 300,
  );
  final largura = context.knobs.double.input(
    label: "Largura do gráfico",
    initialValue: 300,
  );

  return Scaffold(
    body: Center(
      child: RadialChart(
        value: valor,
        min: minimo,
        max: maximo,
        interval: interval,
      ),
    ),
  );
}
