import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_app/app/models/chart_1885_model.dart';

class ChartService {
  static Future<List<Chart1885>> fetchDados() async {
    const username = 'felipe.hoffmeiste@gmail.com';
    const password = 'Hoff88338@';

    final url = Uri.parse(
      'https://appa.cs.simport.com.br/api/rest/latest/region/56/station/13/equipment/FL/AP10/data/86400?fields=windDirectionAverage%2CwindDirectionAverageDescAbv',
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
      print(response.body);
      final chart = chart1885FromJson(response.body);
      return chart;
    } else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }
}
