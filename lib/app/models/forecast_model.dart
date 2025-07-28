// To parse this JSON data, do
//
//     final forecast = forecastFromJson(jsonString);

import 'dart:convert';

List<Forecast> forecastFromJson(String str) =>
    List<Forecast>.from(json.decode(str).map((x) => Forecast.fromJson(x)));

String forecastToJson(List<Forecast> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Forecast {
  final Date? date;
  final double? windGust;
  final int? windDirection;
  final double? windSpeed;

  Forecast({this.date, this.windGust, this.windDirection, this.windSpeed});

  Forecast copyWith({
    Date? date,
    double? windGust,
    int? windDirection,
    double? windSpeed,
  }) => Forecast(
    date: date ?? this.date,
    windGust: windGust ?? this.windGust,
    windDirection: windDirection ?? this.windDirection,
    windSpeed: windSpeed ?? this.windSpeed,
  );

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    windGust: json["windGust"]?.toDouble(),
    windDirection: json["windDirection"],
    windSpeed: json["windSpeed"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toJson(),
    "windGust": windGust,
    "windDirection": windDirection,
    "windSpeed": windSpeed,
  };
}

class Date {
  final int? sec;

  Date({this.sec});

  Date copyWith({int? sec}) => Date(sec: sec ?? this.sec);

  factory Date.fromJson(Map<String, dynamic> json) => Date(sec: json["sec"]);

  Map<String, dynamic> toJson() => {"sec": sec};
}
