import "dart:convert";

import "package:http/http.dart" as http;
import "package:json_app/app/models/auth/login_response_model.dart";

class AuthServiceWeb {
  static Future<LoginResponseModel> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse("http://172.25.120.14:4000/v1/api/login");

      print(
        "[AuthServiceWeb.loginUser] Tentando POST com credenciais e auth header...",
      );

      // Criar credenciais em base64 para Basic Auth
      final credentials = base64Encode(utf8.encode("$username:$password"));

      final response = await http.post(
        url,
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Basic $credentials", // ← ADICIONAR ESTE HEADER
        },
        body: jsonEncode({"username": username, "password": password}),
      );

      print("[AuthServiceWeb.loginUser] Resposta: ${response.statusCode}");
      print("[AuthServiceWeb.loginUser] Body: ${response.body}");

      return _processResponse(response);
    } catch (e) {
      print("[AuthServiceWeb.loginUser] Erro: $e");
      rethrow;
    }
  }

  static LoginResponseModel _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final loginResponse = LoginResponseModel.fromJson(data);
      print(
        "[AuthServiceWeb.loginUser] Login bem-sucedido: ${loginResponse.name}",
      );
      return loginResponse;
    } else if (response.statusCode == 401) {
      final body = response.body;
      if (body.contains("Authorization header required")) {
        throw Exception(
          "Erro de autenticação: Header de autorização necessário",
        );
      } else if (body.contains("Invalid credentials")) {
        throw Exception("Credenciais inválidas. Verifique usuário e senha.");
      } else {
        throw Exception("Erro de autenticação: ${response.body}");
      }
    } else {
      throw Exception(
        "Erro no login: Status ${response.statusCode} - ${response.body}",
      );
    }
  }

  /// Verifica se o usuário tem acesso baseado no token
  static bool hasUserAccess(LoginResponseModel loginResponse) {
    return loginResponse.accessToken.isNotEmpty;
  }

  /// Obtém informações do usuário logado
  static Map<String, dynamic> getUserInfo(LoginResponseModel loginResponse) {
    return {
      "username": loginResponse.username,
      "name": loginResponse.name,
      "photoId": loginResponse.photoId,
      "accessToken": loginResponse.accessToken,
      "refreshToken": loginResponse.refreshToken,
    };
  }
}
