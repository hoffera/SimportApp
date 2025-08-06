// ignore_for_file: public_member_api_docs, sort_constructors_first
import "dart:io";
import "dart:ui" as ui;

import "package:json_app/app/components/cards/commom_card.dart";
import "package:json_app/app/components/sync/vertical%20widget/vertical_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";
import "package:path_provider/path_provider.dart";
import "package:share_plus/share_plus.dart";

part "chart_widget.g.dart";

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
    return SizedBox(
      height: 500,

      child: Box(
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
            iconURL: "https://tcp.cs.simport.com.br/gallery/29/image-download",
          ),
          _buttons(context),
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      children: [
        _expandedChartButton(),
        const SizedBox(width: 8),
        _exportChartButton(context),
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

  Widget _exportChartButton(BuildContext context) {
    return _circleButton(
      icon: Icons.download,
      onPressed: () => exportChartAsImage(context),
    );
  }

  Widget _shareChartButton() {
    return _circleButton(
      icon: Icons.share,
      onPressed: () {
        final box = context.findRenderObject() as RenderBox?;
        shareChartAsImage(box);
      },
    );
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

  Future<void> exportChartAsImage(BuildContext context) async {
    try {
      final file = await _captureChartAndSave();

      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gráfico salvo em: ${file.path}")));
    } catch (e, stackTrace) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erro ao exportar gráfico: $e")));
      }
      debugPrint("Erro ao exportar gráfico: $e\n$stackTrace");
    }
  }

  Future<void> shareChartAsImage(RenderBox? box) async {
    try {
      final file = await _captureChartAndSave();

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: "Confira o gráfico exportado!",
          sharePositionOrigin: box != null
              ? box.localToGlobal(Offset.zero) & box.size
              : null,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint("Erro ao compartilhar gráfico: $e\n$stackTrace");
    }
  }

  Future<File> _captureChartAndSave() async {
    final boundary =
        _chartKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final file = File("${directory.path}/grafico_compartilhado.png");
    await file.writeAsBytes(pngBytes);
    return file;
  }
}
