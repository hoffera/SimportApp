// To parse this JSON data, do
//
//     final marePrediction = marePredictionFromJson(jsonString);

import 'dart:convert';

List<MarePrediction> marePredictionFromJson(String str) =>
    List<MarePrediction>.from(
      json.decode(str).map((x) => MarePrediction.fromJson(x)),
    );

String marePredictionToJson(List<MarePrediction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarePrediction {
  final Date? date;
  final double? tidePrediction;

  MarePrediction({this.date, this.tidePrediction});

  MarePrediction copyWith({Date? date, double? tidePrediction}) =>
      MarePrediction(
        date: date ?? this.date,
        tidePrediction: tidePrediction ?? this.tidePrediction,
      );

  factory MarePrediction.fromJson(Map<String, dynamic> json) => MarePrediction(
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    tidePrediction: json["tidePrediction"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toJson(),
    "tidePrediction": tidePrediction,
  };
}

class Date {
  final int? sec;

  Date({this.sec});

  Date copyWith({int? sec}) => Date(sec: sec ?? this.sec);

  factory Date.fromJson(Map<String, dynamic> json) => Date(sec: json["sec"]);

  Map<String, dynamic> toJson() => {"sec": sec};
}
