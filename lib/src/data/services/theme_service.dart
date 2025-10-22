import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:json_app/src/data/models/theme_model/theme_model.dart";
import "package:json_app/src/data/services/storage_service.dart";

class ThemeService {
  static final String _baseUrl = dotenv.env["APPLICATION_BASEURL"]!;

  static Future<ThemeModel?> getThemeById(int themeId, String language) async {
    try {
      Dio dio = Dio();
      final accessToken = await StorageService.getAcessToken();
      final response = await dio.get(
        "$_baseUrl/theme/$themeId",
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
            "Accept-Language": language,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        return ThemeModel.fromJson(data);
      }
    } catch (e) {
      print("Erro ao buscar themes: $e");
      throw Exception(e);
    }
    return null;
  }

  static Future<String> createTheme(
    String description,
    Map<String, dynamic> lightJson,
    Map<String, dynamic> darkJson,
  ) async {
    try {
      Dio dio = Dio();
      final accessToken = StorageService.getAcessToken();
      final response = await dio.post(
        data: {
          "description": description,
          "light_jsonb": lightJson,
          "dark_jsonb": darkJson,
        },

        "$_baseUrl/theme-create",
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      if (response.statusCode != 200) {
        return "Erro ao adicionar";
      }

      return "Adicionado com sucesso";
    } catch (e) {
      print(e);
      return "Erro ao adicionar $e";
    }
  }
}
