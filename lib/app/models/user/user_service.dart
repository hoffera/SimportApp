import "dart:convert";

import "package:http/http.dart" as http;
import "package:json_app/app/models/user/user_model.dart";

class UserService {
  static Future<UserModel?> fetchUser() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.example.com/user"),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        return UserModel.fromJson(data);
      } else {
        throw Exception("Erro ao buscar usuário: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro ao buscar usuário: $e");
    }
  }
}
