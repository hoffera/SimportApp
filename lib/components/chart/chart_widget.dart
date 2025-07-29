// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui' as ui;

import 'package:json_app/components/cards/commom_card.dart';
import 'package:json_app/components/synfusion/vertical_widget.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:mix/mix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

part 'chart_widget.g.dart';

@jsonWidget
abstract class _ChartWidgetBuilder extends JsonWidgetBuilder {
  const _ChartWidgetBuilder({required super.args});

  @override
  ChartWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class ChartWidget extends StatefulWidget {
  final Widget chart;
  final String title;
  final String subtitle;
  const ChartWidget({
    super.key,
    required this.chart,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final GlobalKey _chartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.elevation(2),
        $box.borderRadius(20),
        $box.color(Theme.of(context).colorScheme.onPrimary),
        $box.padding.all(20),
        $box.alignment.center(),
      ),
      child: Column(
        children: [
          _title(),
          RepaintBoundary(key: _chartKey, child: widget.chart),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommomCard(
            title: widget.title,
            subtitle: widget.subtitle,
            iconURL: 'https://tcp.cs.simport.com.br/gallery/29/image-download',
          ),
          _buttons(),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      children: [
        _expandedChartButton(),
        const SizedBox(width: 8),
        _exportChartButton(),
        const SizedBox(width: 8),
        _shareChartButton(),
      ],
    );
  }

  Widget _expandedChartButton() {
    return _circleButton(
      icon: Icons.open_in_full_rounded,
      onPressed: () {
        VerticalWidget.show(context, child: widget.chart);
      },
    );
  }

  Widget _exportChartButton() {
    return _circleButton(icon: Icons.download, onPressed: exportChartAsImage);
  }

  Widget _shareChartButton() {
    return _circleButton(icon: Icons.share, onPressed: shareChartAsImage);
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Box(
      style: Style(
        $box.elevation(2),
        $box.shape.circle(side: BorderSide(width: 0.5)),
        $box.height(40),
        $box.width(40),
        $box.color(Theme.of(context).colorScheme.onPrimary),
        $box.alignment.center(),
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        iconSize: 20,
        padding: EdgeInsets.zero,
        splashRadius: 20,
      ),
    );
  }

  Future<void> exportChartAsImage() async {
    try {
      final file = await _captureChartAndSave();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gráfico salvo em: ${file.path}')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao exportar gráfico: $e')));
    }
  }

  Future<void> shareChartAsImage() async {
    try {
      final file = await _captureChartAndSave();
      await Share.shareXFiles([
        XFile(file.path),
      ], text: 'Confira o gráfico exportado!');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao compartilhar gráfico: $e')),
      );
    }
  }

  Future<File> _captureChartAndSave() async {
    final boundary =
        _chartKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/grafico_compartilhado.png');
    await file.writeAsBytes(pngBytes);
    return file;
  }
}
