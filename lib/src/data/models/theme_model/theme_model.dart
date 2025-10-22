import "dart:convert";

import "package:json_dynamic_widget/json_dynamic_widget.dart";

class ThemeModel {
  ThemeData light;
  ThemeData dark;

  ThemeModel({required this.light, required this.dark});

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
    light: _toThemeData(json["light_jsonb"]),
    dark: _toThemeData(json["dark_jsonb"]),
  );

  Map<String, dynamic> toJson() => {
    "light_jsonb": ThemeEncoder.encodeThemeData(light),
    "dark_jsonb": ThemeEncoder.encodeThemeData(dark),
  };

  static ThemeData _toThemeData(dynamic jsonData) {
    if (jsonData is String) {
      final themeJson = jsonDecode(jsonData);
      return ThemeDecoder.decodeThemeData(themeJson)!;
    } else if (jsonData is Map<String, dynamic>) {
      return ThemeDecoder.decodeThemeData(jsonData)!;
    } else {
      throw ArgumentError(
        "Expected String or Map<String, dynamic>, got ${jsonData.runtimeType}",
      );
    }
  }
}
