import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:json_app/src/data/models/view/view.dart";
import "package:json_app/src/data/services/storage_service.dart";

class ViewServices {
  static final String _baseUrl = dotenv.env["APPLICATION_BASEURL"]!;

  static Future<List<ViewModel>> getViews(
    int viewClientId,
    String language,
  ) async {
    final accessToken = await StorageService.getAcessToken();

    final dio = Dio();

    try {
      final response = await dio.get(
        "$_baseUrl/view",
        queryParameters: {"client_id": viewClientId},
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
            "Accept-Language": language,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(
          "Erro ao buscar views: ${response.statusCode} - ${response.data}",
        );
      }

      final data = response.data;

      final parsedData = data is String ? jsonDecode(data) : data;

      if (parsedData == null || parsedData is! List) {
        print("[ViewServices.getViews] Resposta vazia ou inválida da API");
        return [];
      }

      final views = (parsedData)
          .map((e) => ViewModel.fromJson(e as Map<String, dynamic>))
          .toList();

      print("[ViewServices.getViews] Views carregadas: ${views.length}");
      return views;
    } catch (e) {
      print("[ViewServices.getViews] Erro: $e");
      rethrow;
    }
  }

  static Future<ViewModel?> getViewById(int viewID, String language) async {
    final accessToken = await StorageService.getAcessToken();

    final dio = Dio();

    try {
      final response = await dio.get(
        "$_baseUrl/view/$viewID",

        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
            "Accept-Language": language,
          },
        ),
      );

      return ViewModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
