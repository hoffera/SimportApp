// To parse this JSON data, do
//
//     final antoninaMare = antoninaMareFromJson(jsonString);

import 'dart:convert';

List<AntoninaMare> antoninaMareFromJson(String str) => List<AntoninaMare>.from(
  json.decode(str).map((x) => AntoninaMare.fromJson(x)),
);

String antoninaMareToJson(List<AntoninaMare> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AntoninaMare {
  final Date? date;
  final Tide? lowTide;
  final Tide? highTide;
  final double? waterLevel;

  AntoninaMare({this.date, this.lowTide, this.highTide, this.waterLevel});

  AntoninaMare copyWith({
    Date? date,
    Tide? lowTide,
    Tide? highTide,
    double? waterLevel,
  }) => AntoninaMare(
    date: date ?? this.date,
    lowTide: lowTide ?? this.lowTide,
    highTide: highTide ?? this.highTide,
    waterLevel: waterLevel ?? this.waterLevel,
  );

  factory AntoninaMare.fromJson(Map<String, dynamic> json) => AntoninaMare(
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    lowTide: json["lowTide"] == null ? null : Tide.fromJson(json["lowTide"]),
    highTide: json["highTide"] == null ? null : Tide.fromJson(json["highTide"]),
    waterLevel: json["waterLevel"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toJson(),
    "lowTide": lowTide?.toJson(),
    "highTide": highTide?.toJson(),
    "waterLevel": waterLevel,
  };
}

class Date {
  final int? sec;

  Date({this.sec});

  Date copyWith({int? sec}) => Date(sec: sec ?? this.sec);

  factory Date.fromJson(Map<String, dynamic> json) => Date(sec: json["sec"]);

  Map<String, dynamic> toJson() => {"sec": sec};
}

class Tide {
  final Date? date;
  final double? value;

  Tide({this.date, this.value});

  Tide copyWith({Date? date, double? value}) =>
      Tide(date: date ?? this.date, value: value ?? this.value);

  factory Tide.fromJson(Map<String, dynamic> json) => Tide(
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    value: json["value"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {"date": date?.toJson(), "value": value};
}
