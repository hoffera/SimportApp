import "dart:convert";

import "package:http/http.dart" as http;
import "package:json_app/app/models/auth/login_response_model.dart";

/// Serviço de autenticação alternativo para Flutter Web usando http
class AuthServiceWeb {
  /// Faz login no servidor usando http (melhor para Flutter Web)
  static Future<LoginResponseModel> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse("http://172.25.120.14:4000/v1/creator/login");

      print("[AuthServiceWeb.loginUser] Tentando POST com corpo vazio...");

      // Tenta primeiro com POST e corpo vazio (como no curl)
      try {
        final response = await http.post(
          url,
          headers: {"accept": "application/json"},
          body: "",
        );

        print(
          "[AuthServiceWeb.loginUser] POST bem-sucedido: ${response.statusCode}",
        );
        return _processResponse(response);
      } catch (e) {
        print("[AuthServiceWeb.loginUser] POST falhou: $e");

        // Tenta com GET (às vezes funciona melhor no web)
        print("[AuthServiceWeb.loginUser] Tentando GET...");
        try {
          final response = await http.get(
            url,
            headers: {"accept": "application/json"},
          );

          print(
            "[AuthServiceWeb.loginUser] GET bem-sucedido: ${response.statusCode}",
          );
          return _processResponse(response);
        } catch (e2) {
          print("[AuthServiceWeb.loginUser] GET também falhou: $e2");

          // Se ambos falharem, lança o erro mais específico
          if (e2.toString().contains("Failed to fetch")) {
            throw Exception(
              "Erro de CORS. Servidor não permite requisições do navegador. Tente usar um proxy ou configure o servidor para aceitar requisições do domínio atual.",
            );
          } else {
            throw Exception("Erro na requisição: $e2");
          }
        }
      }
    } catch (e) {
      print("[AuthServiceWeb.loginUser] Erro final: $e");
      rethrow;
    }
  }

  /// Processa a resposta HTTP
  static LoginResponseModel _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final loginResponse = LoginResponseModel.fromJson(data);
      print(
        "[AuthServiceWeb.loginUser] Login bem-sucedido: ${loginResponse.name}",
      );
      return loginResponse;
    } else {
      throw Exception(
        "Erro no login: Status ${response.statusCode} - ${response.body}",
      );
    }
  }

  /// Verifica se o usuário tem acesso baseado na resposta do login
  static bool hasUserAccess(LoginResponseModel loginResponse) {
    return loginResponse.hasAccess;
  }

  /// Obtém informações do usuário logado
  static Map<String, dynamic> getUserInfo(LoginResponseModel loginResponse) {
    return {
      "username": loginResponse.username,
      "name": loginResponse.name,
      "photoId": loginResponse.photoId,
      "hasAccess": loginResponse.hasAccess,
    };
  }
}
