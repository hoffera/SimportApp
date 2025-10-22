import "package:flutter/material.dart" hide Typography;
import "package:json_app/src/utils/enum/enum.dart";
import "package:json_app/src/utils/typography.dart";

class CustomTypography extends StatelessWidget {
  const CustomTypography({
    super.key,
    required this.variant,
    required this.text,
    this.weight = FontWeight.w400,
    this.color = Colors.black,
    this.align = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
  });

  final FontWeight weight;
  final TypoVariant variant;
  final String text;
  final Color color;
  final TextAlign align;
  final TextOverflow overflow;
  TextStyle _getFontVariant() {
    switch (variant) {
      case TypoVariant.h1:
        return Typography().h1.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
      case TypoVariant.h2:
        return Typography().h2.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
      case TypoVariant.h3:
        return Typography().h3.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
      case TypoVariant.h4:
        return Typography().h4.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
      case TypoVariant.h5:
        return Typography().h5.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
      case TypoVariant.h6:
        return Typography().h6.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
      case TypoVariant.h7:
        return Typography().h7.copyWith(
          fontWeight: weight,
          color: color,
          fontFamily: "Comfortaa",
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getFontVariant().copyWith(height: 1.0),
      textAlign: align,
      textScaler: TextScaler.linear(Typography().textScaleFactor),
      overflow: overflow,
      maxLines: 2,
    );
  }
}
