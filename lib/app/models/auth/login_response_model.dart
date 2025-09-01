class LoginResponseModel {
  final String accessToken;
  final bool hasAccess;
  final String username;
  final String name;
  final int photoId;

  LoginResponseModel({
    required this.accessToken,
    required this.hasAccess,
    required this.username,
    required this.name,
    required this.photoId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final user = json["user"] as Map<String, dynamic>? ?? {};

    return LoginResponseModel(
      accessToken: json["access_token"] as String? ?? "",
      hasAccess: user["has_access"] as bool? ?? false,
      username: user["username"] as String? ?? "",
      name: user["name"] as String? ?? "",
      photoId: user["photo_id"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "access_token": accessToken,
      "user": {
        "has_access": hasAccess,
        "username": username,
        "name": name,
        "photo_id": photoId,
      },
    };
  }

  LoginResponseModel copyWith({
    String? accessToken,
    bool? hasAccess,
    String? username,
    String? name,
    int? photoId,
  }) {
    return LoginResponseModel(
      accessToken: accessToken ?? this.accessToken,
      hasAccess: hasAccess ?? this.hasAccess,
      username: username ?? this.username,
      name: name ?? this.name,
      photoId: photoId ?? this.photoId,
    );
  }

  @override
  String toString() {
    return "LoginResponseModel(accessToken: $accessToken, hasAccess: $hasAccess, username: $username, name: $name, photoId: $photoId)";
  }
}
