class UserModel {
  final String accessToken;
  final String refreshToken;
  final String username;
  final String name;
  final int? photoId;

  UserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.username,
    required this.name,
    this.photoId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json["user"] as Map<String, dynamic>? ?? {};

    return UserModel(
      accessToken: json["access_token"] as String? ?? "",
      refreshToken: json["refresh_token"] as String? ?? "",
      username: user["username"] as String? ?? "",
      name: user["name"] as String? ?? "",
      photoId: user["photo_id"] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "user": {
      "username": username,
      "name": name,
      if (photoId != null) "photo_id": photoId,
    },
  };
}
