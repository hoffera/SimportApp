// To parse this JSON data, do
//
//     final chart1919 = chart1919FromJson(jsonString);

import 'dart:convert';

List<Chart1919> chart1919FromJson(String str) =>
    List<Chart1919>.from(json.decode(str).map((x) => Chart1919.fromJson(x)));

String chart1919ToJson(List<Chart1919> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chart1919 {
  final Date? date;
  final double? windSpeed;
  final double? windSpeedAverage;

  Chart1919({this.date, this.windSpeed, this.windSpeedAverage});

  Chart1919 copyWith({
    Date? date,
    double? windSpeed,
    double? windSpeedAverage,
  }) => Chart1919(
    date: date ?? this.date,
    windSpeed: windSpeed ?? this.windSpeed,
    windSpeedAverage: windSpeedAverage ?? this.windSpeedAverage,
  );

  factory Chart1919.fromJson(Map<String, dynamic> json) => Chart1919(
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    windSpeed: json["windSpeed"]?.toDouble(),
    windSpeedAverage: json["windSpeedAverage"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toJson(),
    "windSpeed": windSpeed,
    "windSpeedAverage": windSpeedAverage,
  };
}

class Date {
  final int? sec;

  Date({this.sec});

  Date copyWith({int? sec}) => Date(sec: sec ?? this.sec);

  factory Date.fromJson(Map<String, dynamic> json) => Date(sec: json["sec"]);

  Map<String, dynamic> toJson() => {"sec": sec};
}
