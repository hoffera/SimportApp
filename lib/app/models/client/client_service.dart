import "package:dio/dio.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/config/api_constants.dart";

class ClientService {
  static Future<List<Client>> fetchClients() async {
    final dio = Dio();
    try {
      final response = await dio.get(ApiConstants.getClients());
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((x) {
              try {
                return Client.fromJson(x);
              } catch (e) {
                print(
                  "fetchClients: Erro ao converter um Client: $e\nDados: $x",
                );
                return null;
              }
            })
            .whereType<Client>()
            .toList();
      } else {
        throw Exception("Erro ao buscar dados: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro na requisição: $e");
    }
  }

  static Future<Client?> findById(String id) async {
    try {
      final clients = await fetchClients();
      return clients.firstWhere(
        (client) => client.id == id,
        orElse: () => throw Exception("Cliente não encontrado com ID: $id"),
      );
    } catch (e) {
      print("Erro ao buscar cliente por ID: $e");
      return null;
    }
  }
}
