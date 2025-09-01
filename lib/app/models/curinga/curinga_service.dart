import "dart:convert";

import "package:flutter/services.dart";
import "package:json_app/app/models/curinga/curinga_model.dart";

class CuringaService {
  static const String _curingaJsonPath = "assets/curinga/curinga.json";

  static Future<List<Curinga>> fetchCuringas() async {
    try {
      final String jsonString = await rootBundle.loadString(_curingaJsonPath);
      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
      return jsonList
          .map((item) => Curinga.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("[fetchCuringas] Erro ao carregar curingas: $e");
      return [];
    }
  }

  static Future<String> replaceCuringa(String jsonStr) async {
    try {
      final List<Curinga> curingas = await fetchCuringas();
      if (curingas.isEmpty) {
        print("[replaceCuringa] Nenhum curinga encontrado");
        return jsonStr;
      }
      final dynamic jsonData = json.decode(jsonStr);
      bool houveReplace = false;
      final dynamic processedData = _processJsonRecursively(
        jsonData,
        curingas,
        (replaced) {
          if (replaced) {
            houveReplace = true;
          }
        },
      );
      if (!houveReplace) {
        print("[replaceCuringa] Nenhum curinga foi substituído");
        return jsonStr;
      }
      return json.encode(processedData);
    } catch (e) {
      print("[replaceCuringa] Erro ao processar curingas: $e");
      return jsonStr;
    }
  }

  static dynamic _processJsonRecursively(
    dynamic data,
    List<Curinga> curingas,
    void Function(bool) onReplace,
  ) {
    if (data is Map<String, dynamic>) {
      final Map<String, dynamic> result = {};
      for (final entry in data.entries) {
        result[entry.key] = _processJsonRecursively(
          entry.value,
          curingas,
          onReplace,
        );
      }
      return result;
    } else if (data is List) {
      return data
          .map((item) => _processJsonRecursively(item, curingas, onReplace))
          .toList();
    } else if (data is String) {
      String processed = data;
      bool replaced = false;
      for (final curinga in curingas) {
        final regex = RegExp(r"#" + RegExp.escape(curinga.type));
        if (regex.hasMatch(processed)) {
          processed = processed.replaceAllMapped(regex, (match) {
            print(
              "[replaceCuringa] Substituindo '${match.group(0)}' por '${curinga.args}'",
            );
            replaced = true;
            return curinga.args is String
                ? curinga.args as String
                : curinga.args.toString();
          });
        }
      }
      if (replaced) {
        onReplace(true);
      }
      return processed;
    } else {
      return data;
    }
  }
}
