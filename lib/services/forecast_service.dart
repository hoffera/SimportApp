import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_app/app/models/forecast_model.dart';

class ForecastService {
  static Future<List<Forecast>> fetchDados() async {
    const username = 'felipe.hoffmeiste@gmail.com';
    const password = 'Hoff88338@';

    final url = Uri.parse(
      'https://appa.cs.simport.com.br/api/rest/latest/region/57/station/1/equipment/F1/WRF1/data/0?fields=windGust%2CwindDirection%2CwindSpeed',
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
      final forecast = forecastFromJson(response.body);
      return forecast;
    } else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }
}
