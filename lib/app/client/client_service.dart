import 'package:dio/dio.dart';
import 'package:json_app/app/client/client_model.dart';
import 'package:json_app/config/api_constants.dart';

class ClientService {
  static Future<List<Client>> fetchClients() async {
    final dio = Dio();

    try {
      final response = await dio.get(ApiConstants.getClients());

      if (response.statusCode == 200 && response.data is List) {
        return List<Client>.from(
          (response.data as List).map((x) {
            try {
              return Client.fromJson(x);
            } catch (e) {
              print('Erro ao converter um Client: $e\nDados: $x');
              return null;
            }
          }).whereType<Client>(), // remove nulls
        );
      } else {
        throw Exception('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}
