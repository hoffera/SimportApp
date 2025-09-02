class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final String username;
  final String name;
  final int? photoId; // photo_id pode ser null

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.username,
    required this.name,
    this.photoId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final user = json["user"] as Map<String, dynamic>? ?? {};

    return LoginResponseModel(
      accessToken: json["access_token"] as String? ?? "",
      refreshToken: json["refresh_token"] as String? ?? "",
      username: user["username"] as String? ?? "",
      name: user["name"] as String? ?? "",
      photoId: user["photo_id"] as int?, // pode ser null
    );
  }
}
