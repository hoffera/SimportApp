import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_app/app/models/antonina_mare_model.dart';

class AntoninaMareService {
  static Future<List<AntoninaMare>> fetchDados() async {
    const username = 'felipe.hoffmeiste@gmail.com';
    const password = 'Hoff88338@';

    final url = Uri.parse(
      'https://appa.cs.simport.com.br/api/rest/latest/region/56/station/12/equipment/FJ/SC20/data/86400?fields=lowTide%2ChighTide%2CwaterLevel',
    );

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'app-version': '2.1',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final chart = antoninaMareFromJson(response.body);
      return chart;
    } else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }
}
