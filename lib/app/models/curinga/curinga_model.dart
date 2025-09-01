import "dart:convert";

List<Curinga> curingaFromJson(String str) => List<Curinga>.from(
  json.decode(str).map((x) => Curinga.fromJson(x as Map<String, dynamic>)),
);

String curingaToJson(List<Curinga> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Curinga {
  final String type;
  final Object? args;

  Curinga({required this.type, required this.args});

  Curinga copyWith({String? type, Object? args}) =>
      Curinga(type: type ?? this.type, args: args ?? this.args);

  factory Curinga.fromJson(Map<String, dynamic> json) =>
      Curinga(type: json["type"] as String, args: json["args"]);

  Map<String, dynamic> toJson() => {"type": type, "args": args};
}
