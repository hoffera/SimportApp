// To parse this JSON data, do
//
//     final chart1885 = chart1885FromJson(jsonString);

import 'dart:convert';

List<Chart1885> chart1885FromJson(String str) =>
    List<Chart1885>.from(json.decode(str).map((x) => Chart1885.fromJson(x)));

String chart1885ToJson(List<Chart1885> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chart1885 {
  final Date? date;
  final int? windDirectionAverage;
  final String? windDirectionAverageDescAbv;

  Chart1885({
    this.date,
    this.windDirectionAverage,
    this.windDirectionAverageDescAbv,
  });

  Chart1885 copyWith({
    Date? date,
    int? windDirectionAverage,
    String? windDirectionAverageDescAbv,
  }) => Chart1885(
    date: date ?? this.date,
    windDirectionAverage: windDirectionAverage ?? this.windDirectionAverage,
    windDirectionAverageDescAbv:
        windDirectionAverageDescAbv ?? this.windDirectionAverageDescAbv,
  );

  factory Chart1885.fromJson(Map<String, dynamic> json) => Chart1885(
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    windDirectionAverage: json["windDirectionAverage"],
    windDirectionAverageDescAbv: json["windDirectionAverageDescAbv"],
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toJson(),
    "windDirectionAverage": windDirectionAverage,
    "windDirectionAverageDescAbv": windDirectionAverageDescAbv,
  };
}

class Date {
  final int? sec;

  Date({this.sec});

  Date copyWith({int? sec}) => Date(sec: sec ?? this.sec);

  factory Date.fromJson(Map<String, dynamic> json) => Date(sec: json["sec"]);

  Map<String, dynamic> toJson() => {"sec": sec};
}
