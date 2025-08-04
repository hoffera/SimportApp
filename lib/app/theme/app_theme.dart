import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class AppTheme {
  late ThemeData light;
  late ThemeData dark;

  Future<void> loadThemes() async {
    final lightStr = await rootBundle.loadString('assets/theme/light.json');
    final darkStr = await rootBundle.loadString('assets/theme/dark.json');

    final lightJson = jsonDecode(lightStr);
    final darkJson = jsonDecode(darkStr);

    light = ThemeDecoder.decodeThemeData(lightJson)!;
    dark = ThemeDecoder.decodeThemeData(darkJson)!;
  }
}
