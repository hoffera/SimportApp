import 'package:geocoding/geocoding.dart';

class Weather {
  final double latitude;
  final double longitude;
  final List<String> times;
  final List<double> temperatures;
  final double tempMax;
  final double tempMin;
  final List<double> precipitation;
  final String city;
  final int weatherCode;

  Weather({
    required this.tempMax,
    required this.tempMin,
    required this.latitude,
    required this.longitude,
    required this.times,
    required this.temperatures,
    required this.precipitation,
    required this.city,
    required this.weatherCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json['latitude'],
      longitude: json['longitude'],
      times: List<String>.from(json['hourly']['time']),
      temperatures: List<double>.from(json['hourly']['temperature_2m']),
      precipitation: List<double>.from(json['hourly']['precipitation']),
      city: '',
      weatherCode: json['current_weather']?['weathercode'] ?? 0,
      tempMax: (json['daily']['temperature_2m_max'][0] as num).toDouble(),
      tempMin: (json['daily']['temperature_2m_min'][0] as num).toDouble(),
    );
  }
  static Future<Weather> fromJsonWithCity(Map<String, dynamic> json) async {
    final weather = Weather.fromJson(json);

    String city = 'Cidade desconhecida';
    try {
      final placemarks = await placemarkFromCoordinates(
        weather.latitude,
        weather.longitude,
      );

      print('Placemarks: $placemarks');
      if (placemarks.isNotEmpty) {
        print('Locality: ${placemarks.first.locality}');
        print('SubAdminArea: ${placemarks.first.subAdministrativeArea}');
        String? getNonEmptyString(List<String?> candidates) {
          for (var s in candidates) {
            if (s != null && s.isNotEmpty) return s;
          }
          return null;
        }

        city =
            getNonEmptyString([
              placemarks.first.locality,
              placemarks.first.subAdministrativeArea,
              placemarks.first.administrativeArea,
            ]) ??
            city;
      }
    } catch (e) {
      // ignore erros de geocoding
      print('Erro no geocoding: $e');
    }

    // Retorna uma nova instância com a cidade preenchida
    return Weather(
      latitude: weather.latitude,
      longitude: weather.longitude,
      times: weather.times,
      temperatures: weather.temperatures,
      precipitation: weather.precipitation,
      city: city,
      weatherCode: weather.weatherCode,
      tempMax: weather.tempMax,
      tempMin: weather.tempMin,
    );
  }
}
