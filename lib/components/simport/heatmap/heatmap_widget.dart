import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:mix/mix.dart';

class HeatmapWidget extends StatefulWidget {
  final List<HeatmapD> data;
  final List<String> time;
  const HeatmapWidget({super.key, required this.data, required this.time});

  @override
  State<HeatmapWidget> createState() => _HeatmapWidgetState();
}

class _HeatmapWidgetState extends State<HeatmapWidget> {
  late int boxCount = widget.data.length;
  final double boxHeight = 30;
  final double boxPadding = 0.5;
  final double titleHeight = 18;

  late double totalHeight;

  @override
  void initState() {
    boxCount = widget.data.length;
    totalHeight = (boxHeight + 2 * boxPadding) * boxCount + titleHeight + 20;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
        child: Row(children: [labels(), _data()]),
      ),
    );
  }

  Widget _data() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            widget.data.first.dados.length,
            (i) => hour(i),
          ),
        ),
      ),
    );
  }

  Widget hour(int i) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleHour(i),
        Row(children: [line(i)]),
      ],
    );
  }

  Widget line(int i) {
    return Stack(
      children: [
        PressableBox(
          style: Style(),
          onPress: () {
            print("pressed line");
          },
          child: Column(
            children: List.generate(
              widget.data.length,
              (x) => box(widget.data[x].dados[i], Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget box(String data, Color color) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0, 0),
      child: Container(
        height: boxHeight,
        width: 40,
        color: color,
        alignment: Alignment.center,
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }

  Widget labels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: titleHeight),
        Column(
          children: List.generate(
            widget.data.length,
            (i) => label(widget.data[i].label),
          ),
        ),
      ],
    );
  }

  Widget label(String label) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 2, 0),
      child: Container(
        height: boxHeight,

        color: AppColors.background,
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget titleHour(int i) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0, 0),
      child: SizedBox(
        height: titleHeight,
        width: 40,
        child: Text(
          "${widget.time[i]}h",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HeatmapD {
  final String label;
  final List<String> dados;
  final List<Color> color;

  HeatmapD({required this.color, required this.label, required this.dados});
}
