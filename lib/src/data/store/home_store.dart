import "dart:convert";

import "package:go_router/go_router.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/models/client/client.dart";
import "package:json_app/src/data/store/client_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/data/store/user_store.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mobx/mobx.dart";

part "home_store.g.dart";

enum HomeStoreState { loading, success, error, empty }

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final TextEditingController searchController = TextEditingController();

  final ClientStore clientStore = getIt<ClientStore>();

  @observable
  HomeStoreState state = HomeStoreState.loading;

  @observable
  String searchQuery = "";

  @observable
  String? errorMessage;

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
  }

  @action
  Future<void> selectClient(ClientModel client, BuildContext context) async {
    try {
      var activeApp = client.mainViewId;
      if (activeApp == null) {
        print("Erro ao selecionar cliente: mainViewId é null");
        return;
      }

      final userStore = getIt<UserStore>();
      final currentUser = userStore.currentUser;

      if (currentUser == null) {
        print("Erro ao selecionar cliente: currentUser é null");
        return;
      }

      registry.setValue("userName", currentUser.name);
      registry.setValue("userEmail", currentUser.username);

      registry.setValue(
        "userAvatarUrl",
        currentUser.photoId != null
            ? "https://appix.cs.simport.com.br/file/${currentUser.photoId}/image"
            : "",
      );

      registry.setValue("clientID", client.clientId);
      registry.setValue("clientName", client.name);
      registry.setValue("clientLogoUrl", client.logoUrl);
      final themeStore = getIt<ThemeStore>();
      if (client.themeId != null) {
        await themeStore.getThemeById(client.themeId!);
      }

      final mainView = client.views.firstWhere(
        (view) => view.id == activeApp,
        orElse: () =>
            throw StateError("Nenhuma view encontrada com ID $activeApp"),
      );

      clientStore.setSelectedClient(client);

      final skeleton = mainView.skeleton;

      if (context.mounted) {
        if (skeleton == null) {
          context.go("/error-page");
          return;
        }
        goToDynamicPage(activeApp, skeleton, context);
      }
    } catch (e) {
      context.go("/error-page");
      print("Erro ao selecionar cliente: $e");
      return;
    }
  }

  void goToDynamicPage(int id, String skeleton, BuildContext context) {
    final encodedSkeleton = base64Encode(utf8.encode(skeleton));
    context.go("/dynamic-page/$id?skeleton=$encodedSkeleton");
  }

  @action
  Future<void> loadHome() async {
    state = HomeStoreState.loading;
    try {
      final themeStore = getIt<ThemeStore>();

      await clientStore.loadClients();

      if (clientStore.clientList.isEmpty) {
        state = HomeStoreState.empty;
      } else {
        getIt<ClientStore>().clientList = clientStore.clientList;
        state = HomeStoreState.success;
      }
    } catch (e) {
      errorMessage = e.toString();
      state = HomeStoreState.error;
    }
  }
}
