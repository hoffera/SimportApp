import "dart:convert";

class ViewModel {
  final int id;
  final String title;
  final String? skeleton;
  final String? scaffold;

  ViewModel({
    required this.id,
    required this.title,
    this.skeleton,
    this.scaffold,
  });

  factory ViewModel.fromJson(Map<String, dynamic> json) {
    return ViewModel(
      id: json["id"] ?? 0,
      title: json["titulo"] ?? "",
      skeleton: json["skeleton"] is String
          ? json["skeleton"]
          : jsonEncode(json["skeleton"]),
      scaffold: json["scaffold"] is String
          ? json["scaffold"]
          : jsonEncode(json["scaffold"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "skeleton": skeleton,
      "scaffold": scaffold,
    };
  }
}
