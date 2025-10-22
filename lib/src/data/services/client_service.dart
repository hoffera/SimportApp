import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:json_app/src/data/models/client/client.dart";

import "storage_service.dart";

class ClientService {
  static final String _baseUrl = dotenv.env["APPLICATION_BASEURL"]!;
  static Future<List<ClientModel>> fetchClients(String language) async {
    final accessToken = await StorageService.getAcessToken();

    final dio = Dio();
    final response = await dio.get(
      "$_baseUrl/client",
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

      if (data == null) {
        return [];
      }

      if (data is List) {
        return data
            .where((x) => x != null)
            .map((x) => ClientModel.fromJson(Map<String, dynamic>.from(x)))
            .toList();
      }

      if (data is Map) {
        return [ClientModel.fromJson(Map<String, dynamic>.from(data))];
      }

      throw Exception("Formato de dados inválido recebido da API");
    } else {
      throw Exception(
        "Erro ao buscar clientes: ${response.statusCode} - ${response.data}",
      );
    }
  }

  static Future<ClientModel?> findById(String clientId, String language) async {
    final accessToken = await StorageService.getAcessToken();
    final url = Uri.parse("$_baseUrl/client/$clientId");
    final response = await http.get(
      url,
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
        "Accept-Language": language,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return ClientModel.fromJson(data);
    } else {
      throw Exception(
        "Erro ao buscar clientes: ${response.statusCode} - ${response.body}",
      );
    }
  }
}
