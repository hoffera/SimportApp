import "../view/view.dart";

class ClientModel {
  final String clientId;
  final String name;
  final String logoUrl;
  final String version;
  final String hashVersion;
  final int? mainViewId;
  final int? themeId;
  final List<ViewModel> views;

  ClientModel({
    required this.clientId,
    required this.name,
    required this.logoUrl,
    required this.version,
    required this.hashVersion,
    this.mainViewId,
    this.themeId,
    required this.views,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    List<ViewModel> viewsList = [];
    if (json["views"] != null && json["views"] is List) {
      viewsList = (json["views"] as List)
          .map((e) => ViewModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    return ClientModel(
      clientId: json["client_id"] ?? "",
      name: json["name"] ?? "",
      logoUrl: json["logo_url"] ?? "",
      version: json["version"] ?? "",
      hashVersion: json["hash_version"] ?? "",
      mainViewId: json["main_view"],
      themeId: json["theme_id"],
      views: viewsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "name": name,
      "logo_url": logoUrl,
      "version": version,
      "hash_version": hashVersion,
      "main_view": mainViewId,
      "theme_id": themeId,
      "views": views.map((view) => view.toJson()).toList(),
    };
  }
}
