import "dart:convert";

List<App> viewClientFromJson(String str) =>
    List<App>.from(json.decode(str).map((x) => App.fromJson(x)));

String viewClientToJson(List<App> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class App {
  final int id;
  final String clientId;
  bool active;
  final String version;
  final int? themeId;
  final int? mainView;
  final String? hashVersion;
  final int? handlerId;

  App({
    required this.id,
    required this.clientId,
    required this.active,
    required this.version,
    this.themeId,
    this.mainView,
    this.hashVersion,
    this.handlerId,
  });

  factory App.fromJson(Map<String, dynamic> json) => App(
    id: json["id"],
    clientId: json["client_id"],
    active: json["active"],
    version: json["version"],
    themeId: json["theme_id"],
    mainView: json["main_view"],
    hashVersion: json["hash_version"],
    handlerId: json["handler_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client_id": clientId,
    "active": active,
    "version": version,
    "theme_id": themeId,
    "main_view": mainView,
    "hash_version": hashVersion,
    "handler_id": handlerId,
  };
}
