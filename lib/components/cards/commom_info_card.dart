import 'package:flutter/material.dart';
import 'package:json_app/components/cards/commom_card.dart';
import 'package:json_app/components/cards/info_card.dart';
import 'package:mix/mix.dart';

class CommomInfoCard extends StatelessWidget {
  const CommomInfoCard({
    super.key,

    required this.infoTitle,
    this.infoSubtitle,
    this.infoUnit,
    required this.iconURL,
    required this.title,
    required this.subtitle,
  });
  final String iconURL;
  final String title;
  final String subtitle;
  final String? infoSubtitle;
  final String infoTitle;
  final String? infoUnit;

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color.white(),
        $box.borderRadius.all(20),
        $box.padding.all(20),

        $box.width(150),
        $box.elevation(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommomCard(title: title, subtitle: subtitle, iconURL: iconURL),

          InfoCard(title: infoTitle, unit: infoUnit, subtitle: infoSubtitle),
        ],
      ),
    );
  }
}
