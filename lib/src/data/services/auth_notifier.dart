import "package:flutter/foundation.dart";
import "package:json_app/src/data/services/storage_service.dart";
import "package:json_app/src/data/services/user_service.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isInitialized = false;
  bool _isLoading = true;

  bool get isLoggedIn => _isLoggedIn;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;

  Future<void> _checkToken() async {
    _isLoading = true;
    notifyListeners();
    try {
      final token = await StorageService.getAcessToken();

      if (token == null || token.isEmpty) {
        _isLoggedIn = false;
        _isInitialized = true;
        notifyListeners();
        return;
      }

      final user = await UserService.refreshToken(refreshToken: token);
      _isLoggedIn = user != null;

      if (!_isLoggedIn) {
        await StorageService.clearLoginData();
      }
    } catch (e) {
      print("[AuthNotifier] Erro ao verificar token: $e");
      _isLoggedIn = false;
      await StorageService.clearLoginData();
    } finally {
      _isLoading = false; // ← Definir loading como false
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await _checkToken();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    notifyListeners();
  }
}
