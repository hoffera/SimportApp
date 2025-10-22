import "package:flutter/material.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/models/view/view.dart";
import "package:json_app/src/data/services/view_services.dart";
import "package:json_app/src/data/store/client_store.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:mobx/mobx.dart";

part "dynamic_screen_store.g.dart";

class DynamicScreenStore = _DynamicScreenStore with _$DynamicScreenStore;

abstract class _DynamicScreenStore with Store {
  @observable
  DynamicScreenState state = DynamicScreenState.loading;

  @observable
  ViewModel? view;

  @action
  Future<void> loadDynamicScreen(int pageID) async {
    state = DynamicScreenState.loading;

    try {
      final language = getIt<LanguageStore>().currentLocale.languageCode;
      view = await ViewServices.getViewById(pageID, language);
      final ClientStore clientStore = getIt<ClientStore>();
      // await clientStore.selectClientById(clientStore.selectedClient!.clientId);
      await getIt<ThemeStore>().getThemeById(
        clientStore.selectedClient!.themeId!,
      );
      state = DynamicScreenState.success;
    } catch (e) {
      state = DynamicScreenState.error;
      debugPrint("Erro ao carregar view: $e");
    }
  }
}

enum DynamicScreenState { loading, success, error }
