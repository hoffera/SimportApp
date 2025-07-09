import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:mix/mix.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return StyledText(
      title,
      style: Style(
        $text.style.color(AppColors.background),
        $text.style.fontSize(30),
        $text.style.fontWeight(FontWeight.w700),
        $text.strutStyle.fontFamily('Comfortaa'),
      ),
    );
  }
}
