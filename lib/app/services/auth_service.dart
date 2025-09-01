import "dart:convert";

import "package:dio/dio.dart";
import "package:json_app/app/models/auth/login_response_model.dart";
import "package:json_app/config/auth_constants.dart";

class AuthService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AuthConstants.baseUrl,
      connectTimeout: Duration(seconds: AuthConstants.connectionTimeout),
      receiveTimeout: Duration(seconds: AuthConstants.receiveTimeout),
      headers: AuthConstants.defaultHeaders,
      // Configurações específicas para Flutter Web
      validateStatus: (status) {
        return status != null && status < 500; // Aceita status 2xx, 3xx e 4xx
      },
    ),
  );

  /// Faz login no servidor
  static Future<LoginResponseModel> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      print("[AuthService.loginUser] Iniciando login para usuário: $username");

      final credentials = base64Encode(utf8.encode("$username:$password"));

      Response response;

      // ===== TESTE 1: Usando Basic Auth (como no curl) =====
      try {
        print("[AuthService.loginUser] Tentando login com Basic Auth");
        response = await _dio.post(
          AuthConstants.loginEndpoint,
          options: Options(
            headers: {
              "accept": "application/json",
              "Authorization": "Basic $credentials",
            },
          ),
        );
      } on DioException catch (e) {
        print("[AuthService.loginUser] Erro com Basic Auth: ${e.message}");
        print("[AuthService.loginUser] Tipo de erro: ${e.type}");
        print("[AuthService.loginUser] Status: ${e.response?.statusCode}");
        print("[AuthService.loginUser] Data: ${e.response?.data}");

        // Se for erro 401, significa que as credenciais estão erradas
        if (e.response?.statusCode == 401) {
          throw Exception("Credenciais inválidas. Verifique usuário e senha.");
        }

        // Se for erro de conexão, tenta método alternativo
        if (e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.connectionTimeout) {
          print("[AuthService.loginUser] Tentando método alternativo...");

          // ===== TESTE 2: Enviando user/pass no body =====
          try {
            response = await _dio.post(
              AuthConstants.loginEndpoint,
              options: Options(headers: {"accept": "application/json"}),
              data: {"username": username, "password": password},
            );
          } on DioException catch (e2) {
            print(
              "[AuthService.loginUser] Erro método alternativo: ${e2.message}",
            );
            print("[AuthService.loginUser] Tipo de erro: ${e2.type}");

            // Se ambos falharem, lança o erro mais específico
            if (e2.response?.statusCode == 401) {
              throw Exception(
                "Credenciais inválidas. Verifique usuário e senha.",
              );
            } else if (e2.type == DioExceptionType.connectionError) {
              throw Exception(
                "Erro de conexão. Verifique se o servidor está online.",
              );
            } else {
              throw Exception("Erro na requisição: ${e2.message}");
            }
          }
        } else {
          // Para outros tipos de erro, lança o erro original
          throw Exception("Erro na requisição: ${e.message}");
        }
      }

      print(
        "[AuthService.loginUser] Resposta recebida: ${response.statusCode}",
      );
      print("[AuthService.loginUser] Data: ${response.data}");

      if (response.statusCode == 200) {
        final loginResponse = LoginResponseModel.fromJson(response.data);
        print(
          "[AuthService.loginUser] Login realizado com sucesso: ${loginResponse.name}",
        );
        return loginResponse;
      } else {
        throw Exception("Erro no login: Status ${response.statusCode}");
      }
    } catch (e) {
      print("[AuthService.loginUser] Erro inesperado: $e");
      if (e.toString().contains("Credenciais inválidas")) {
        rethrow; // Re-lança erros de credenciais
      } else if (e.toString().contains("Erro de conexão")) {
        rethrow; // Re-lança erros de conexão
      } else {
        throw Exception("Erro inesperado: $e");
      }
    }
  }

  static bool hasUserAccess(LoginResponseModel loginResponse) {
    return loginResponse.hasAccess;
  }

  static Map<String, dynamic> getUserInfo(LoginResponseModel loginResponse) {
    return {
      "username": loginResponse.username,
      "name": loginResponse.name,
      "photoId": loginResponse.photoId,
      "hasAccess": loginResponse.hasAccess,
    };
  }
}
