import "package:flutter_secure_storage/flutter_secure_storage.dart";

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveCredentials(
    String login,
    String name,
    int? fotoId,
    String password,
  ) async {
    await _storage.write(key: "login", value: login);
    await _storage.write(key: "name", value: name);
    await _storage.write(key: "fotoId", value: fotoId?.toString());
    await _storage.write(key: "password", value: password);
  }

  Future<Map<String, String?>> getCredentials() async {
    final login = await _storage.read(key: "login", iOptions: IOSOptions());
    final password = await _storage.read(
      key: "password",
      iOptions: IOSOptions(),
    );
    final name = await _storage.read(key: "name", iOptions: IOSOptions());
    final fotoId = await _storage.read(key: "fotoId", iOptions: IOSOptions());

    return {
      "login": login,
      "password": password,
      "name": name,
      "fotoId": fotoId,
    };
  }

  Future<bool> hasCredentials() async {
    final login = await _storage.read(key: "login", iOptions: IOSOptions());
    final password = await _storage.read(
      key: "password",
      iOptions: IOSOptions(),
    );

    if (login == null || password == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> clearCredentials() async {
    await _storage.deleteAll();
  }

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _storage.write(key: "themeMode", value: isDarkMode.toString());
  }

  Future<bool> getThemeMode() async {
    final themeMode = await _storage.read(
      key: "themeMode",
      iOptions: IOSOptions(),
    );
    return themeMode == "true";
  }

  Future<void> saveLanguage(String language) async {
    await _storage.write(key: "language", value: language);
  }

  Future<String?> getLanguage() async {
    final language = await _storage.read(
      key: "language",
      iOptions: IOSOptions(),
    );
    if (language == null) {
      return null;
    }
    return language;
  }
}
