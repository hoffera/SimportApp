import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  /// Verde vibrante
  static const primary = Color.fromARGB(255, 0, 86, 147);

  /// Roxo claro para detalhes
  static const secondary = Color(0xFFC39BD3);

  /// Fundo roxo escuro
  static const background = Color(0xFF001b48);

  static const backgroundCard = Color(0xFFf0faff);
  static const borderCard = Color(0xFFdbeafe);

  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

enum TypographyVariant {
  /// font-size: 28
  h1,

  /// font-size: 24
  h2,

  /// font-size: 18
  h3,

  /// font-size: 16
  h4,

  /// font-size: 14
  h5,

  /// font-size: 12
  h6,

  /// font-size: 10
  h7,
}
