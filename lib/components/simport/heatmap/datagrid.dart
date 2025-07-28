import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/services/heat_data_service.dart';
import 'package:mix/mix.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class CustomHeatMap extends StatefulWidget {
  final List<HeatmapData> data;
  final List<String> time;

  const CustomHeatMap({super.key, required this.data, required this.time});

  @override
  State<CustomHeatMap> createState() => _CustomHeatMapState();
}

class _CustomHeatMapState extends State<CustomHeatMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: AppColors.contentColorRed,
      child: Center(
        child: StickyHeadersTable(
          columnsLength: widget.time.length,
          columnsTitleBuilder: (i) => _boxTitle(widget.time[i]),

          rowsLength: widget.data.length,
          rowsTitleBuilder: (i) => Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.data[i].label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          legendCell: SizedBox(),
          cellAlignments: CellAlignments.fixed(
            contentCellAlignment: Alignment.center,
            stickyColumnAlignment: Alignment.centerLeft,
            stickyRowAlignment: Alignment.centerLeft,
            stickyLegendAlignment: Alignment.centerLeft,
          ),
          cellDimensions: CellDimensions.fixed(
            contentCellWidth: 50,
            contentCellHeight: 40,

            stickyLegendWidth: 80,
            stickyLegendHeight: 40,
          ),

          contentCellBuilder: (i, j) => _boxData(widget.data[j].dado[i]),
        ),
      ),
    );
  }

  Widget _boxTitle(String text) {
    return Box(
      style: Style(
        $box.width(100),
        $box.height(75),
        $box.color(AppColors.background),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _boxData(String text) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Box(
        style: Style(
          $box.width(100),
          $box.height(75),
          $box.color.blue(),
          $box.borderRadius.all(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
