import "package:json_app/src/data/services/storage_service.dart";
import "package:json_app/src/data/services/user_service.dart";
import "package:mobx/mobx.dart";

import "../models/user/user_model.dart";

part "user_store.g.dart";

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  UserModel? currentUser;

  @observable
  String? currentImageUrl;

  @observable
  UserStoreState state = UserStoreState.loading;

  @observable
  bool isInitialized = false;

  @action
  Future<void> loginUser(String username, String password) async {
    state = UserStoreState.loading;
    try {
      currentUser = await UserService.loginUser(
        username: username,
        password: password,
      );

      await StorageService.saveLoginToken(currentUser!.refreshToken);

      state = UserStoreState.loaded;
    } catch (e) {
      print("[UserStore.loginUser] Erro: $e");
      state = UserStoreState.empty;
      rethrow;
    }
  }

  @action
  Future<void> saveCurrentUser(UserModel user) async {
    await StorageService.saveLoginToken(user.refreshToken);
    currentUser = user;
  }

  @action
  Future<void> loadUser() async {
    try {
      final token = await StorageService.getAcessToken();

      if (token == null || token.isEmpty) {
        state = UserStoreState.empty;
        return;
      }

      final user = await UserService.refreshToken(refreshToken: token);

      currentUser = user;
      state = UserStoreState.loaded;
    } catch (e) {
      print("falha ao carregar usuario: $e");
      state = UserStoreState.empty;
    }
  }

  @action
  Future<void> refresh() async {
    await loadUser();
  }

  @action
  void logout() {
    currentUser = null;
    state = UserStoreState.empty;
    StorageService.clearLoginData();
  }

  @computed
  bool get isLoggedIn => state == UserStoreState.loaded && currentUser != null;
}

enum UserStoreState { loading, loaded, empty }
