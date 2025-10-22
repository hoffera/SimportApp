import "package:shared_preferences/shared_preferences.dart";

class StorageService {
  static const String _userToken = "user_token";
  static SharedPreferences? _prefs;

  static Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveLoginToken(String refreshToken) async {
    try {
      await _initPrefs();
      await _prefs!.setString(_userToken, refreshToken);
    } catch (e) {
      print("[StorageService] Erro ao salvar dados: $e");
      rethrow;
    }
  }

  static Future<String?> getAcessToken() async {
    try {
      await _initPrefs();
      return _prefs!.getString(_userToken);
    } catch (e) {
      print("[StorageService] Erro ao obter token: $e");
      return null;
    }
  }

  static Future<void> clearLoginData() async {
    try {
      await _initPrefs();
      await _prefs!.remove(_userToken);
    } catch (e) {
      print("[StorageService] Erro ao remover token: $e");
      rethrow;
    }
  }
}
