import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class AppTheme {
  late ThemeData light;
  late ThemeData dark;

  Future<void> loadThemes() async {
    // Carrega os arquivos JSON dos temas
    final lightStr = await rootBundle.loadString("assets/theme/light.json");
    final darkStr = await rootBundle.loadString("assets/theme/dark.json");

    final lightJson = jsonDecode(lightStr) as Map<String, dynamic>;
    final darkJson = jsonDecode(darkStr) as Map<String, dynamic>;

    // Converte os JSONs para ThemeData usando implementação nativa
    light = _jsonToThemeData(lightJson);
    dark = _jsonToThemeData(darkJson);
  }

  /// Converte um JSON para ThemeData usando implementação nativa
  ThemeData _jsonToThemeData(Map<String, dynamic> json) {
    return ThemeData(
      brightness: _getBrightness(json["brightness"]),
      primaryColor: _getColor(json["primaryColor"]),
      primarySwatch: _getMaterialColor(json["primarySwatch"]),
      scaffoldBackgroundColor: _getColor(json["scaffoldBackgroundColor"]),
      appBarTheme: _getAppBarTheme(json["appBarTheme"]),
      textTheme: _getTextTheme(json["textTheme"]),
      colorScheme: _getColorScheme(json["colorScheme"]),
    );
  }

  Brightness? _getBrightness(dynamic value) {
    if (value == "light") return Brightness.light;
    if (value == "dark") return Brightness.dark;
    return null;
  }

  Color? _getColor(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      // Remove o '#' se presente e converte para Color
      final hex = value.startsWith("#") ? value.substring(1) : value;
      if (hex.length == 6) {
        return Color(int.parse("FF$hex", radix: 16));
      }
    }
    return null;
  }

  MaterialColor? _getMaterialColor(dynamic value) {
    if (value == null) return null;
    // Mapeia cores básicas para MaterialColor
    final color = _getColor(value);
    if (color != null) {
      return _createMaterialColor(color);
    }
    return null;
  }

  MaterialColor _createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  AppBarTheme? _getAppBarTheme(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) {
      return AppBarTheme(
        backgroundColor: _getColor(value["backgroundColor"]),
        foregroundColor: _getColor(value["foregroundColor"]),
        elevation: value["elevation"]?.toDouble(),
      );
    }
    return null;
  }

  TextTheme? _getTextTheme(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) {
      return TextTheme(
        headlineLarge: _getTextStyle(value["headlineLarge"]),
        headlineMedium: _getTextStyle(value["headlineMedium"]),
        headlineSmall: _getTextStyle(value["headlineSmall"]),
        titleLarge: _getTextStyle(value["titleLarge"]),
        titleMedium: _getTextStyle(value["titleMedium"]),
        titleSmall: _getTextStyle(value["titleSmall"]),
        bodyLarge: _getTextStyle(value["bodyLarge"]),
        bodyMedium: _getTextStyle(value["bodyMedium"]),
        bodySmall: _getTextStyle(value["bodySmall"]),
      );
    }
    return null;
  }

  TextStyle? _getTextStyle(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) {
      return TextStyle(
        color: _getColor(value["color"]),
        fontSize: value["fontSize"]?.toDouble(),
        fontWeight: _getFontWeight(value["fontWeight"]),
        fontFamily: value["fontFamily"],
      );
    }
    return null;
  }

  FontWeight? _getFontWeight(dynamic value) {
    if (value == null) return null;
    switch (value.toString().toLowerCase()) {
      case "bold":
        return FontWeight.bold;
      case "normal":
        return FontWeight.normal;
      case "w100":
        return FontWeight.w100;
      case "w200":
        return FontWeight.w200;
      case "w300":
        return FontWeight.w300;
      case "w400":
        return FontWeight.w400;
      case "w500":
        return FontWeight.w500;
      case "w600":
        return FontWeight.w600;
      case "w700":
        return FontWeight.w700;
      case "w800":
        return FontWeight.w800;
      case "w900":
        return FontWeight.w900;
      default:
        return null;
    }
  }

  ColorScheme? _getColorScheme(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) {
      return ColorScheme(
        brightness: _getBrightness(value["brightness"]) ?? Brightness.light,
        primary: _getColor(value["primary"]) ?? Colors.blue,
        onPrimary: _getColor(value["onPrimary"]) ?? Colors.white,
        secondary: _getColor(value["secondary"]) ?? Colors.blueAccent,
        onSecondary: _getColor(value["onSecondary"]) ?? Colors.white,
        error: _getColor(value["error"]) ?? Colors.red,
        onError: _getColor(value["onError"]) ?? Colors.white,
        surface: _getColor(value["surface"]) ?? Colors.white,
        onSurface: _getColor(value["onSurface"]) ?? Colors.black,
      );
    }
    return null;
  }
}
