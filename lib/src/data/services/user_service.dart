import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:json_app/src/data/store/user_store.dart";

import "../../../../main.dart";
import "../models/user/user_model.dart";

class UserService {
  static final String _baseUrl = dotenv.env["APPLICATION_BASEURL"]!;
  static final String _resetUrl = dotenv.env["RESET_PASSWORD_URL"]!;
  static Future<UserModel> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse("$_baseUrl/login");

      final credentials = base64Encode(utf8.encode("$username:$password"));

      final response = await http.post(
        url,
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Basic $credentials",
        },
        body: jsonEncode({"username": username, "password": password}),
      );
      final userModel = await _processResponse(response);

      return userModel;
    } catch (e) {
      print("[UserService.loginUser] Erro: $e");
      rethrow;
    }
  }

  static Future<UserModel?> refreshToken({
    required String? refreshToken,
  }) async {
    try {
      if (refreshToken == null) {
        return null;
      }
      final url = Uri.parse("$_baseUrl/refresh?refresh_token=$refreshToken");

      final response = await http.post(
        url,
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $refreshToken",
        },
      );

      return _processResponse(response);
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel> _processResponse(http.Response response) async {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final loginResponse = UserModel.fromJson(data);
      await getIt<UserStore>().saveCurrentUser(loginResponse);

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
    } else if (response.statusCode == 502) {
      final body = response.body;
      if (body.contains("Invalid credentials")) {
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

  static Future<void> resetPassword({required String username}) async {
    final dio = Dio();

    try {
      await dio.post(
        _resetUrl,
        data: {"username": username},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } catch (e) {
      return;
    }
  }
}
