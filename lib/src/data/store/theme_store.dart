import "package:json_app/src/data/services/secure_storage_service.dart";
import "package:json_app/src/data/services/theme_service.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/json%20dynamic%20widget/register/register_functions.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mobx/mobx.dart";

import "../../../main.dart";
import "../models/theme_model/theme_model.dart";

part "theme_store.g.dart";

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  bool isDarkMode = false;

  @observable
  ThemeState state = ThemeState.loading;

  @observable
  ThemeModel? simportThemeModel;

  @observable
  ThemeModel? clientThemeModel;

  @observable
  ThemeData? selectedSimportTheme;

  @observable
  ThemeData? selectedClientTheme;

  @observable
  ThemeData themeDefault = ThemeData();

  @computed
  bool get isLoading => state == ThemeState.loading;

  @action
  Future<void> getThemeById(int themeId) async {
    final language = getIt<LanguageStore>().currentLocale.languageCode;

    clientThemeModel = await ThemeService.getThemeById(themeId, language);
  }

  @action
  void saveThemeDefault(ThemeData theme) {
    themeDefault = theme;
  }

  @action
  void saveSimportThemeModel(ThemeModel theme) {
    simportThemeModel = theme;
  }

  @action
  void setSelectedSimportTheme(bool isDarkMode) {
    if (isDarkMode) {
      selectedSimportTheme = simportThemeModel?.dark;
    } else {
      selectedSimportTheme = simportThemeModel?.light;
    }
  }

  @action
  void setSelectedClientTheme(bool isDarkMode) {
    if (isDarkMode) {
      selectedClientTheme = clientThemeModel?.dark;

      RegisterFunctions.registerThemeValues(
        registry,
        clientThemeModel!.dark,
        clientThemeModel!.dark.colorScheme,
      );
    } else {
      selectedClientTheme = clientThemeModel?.light;
      RegisterFunctions.registerThemeValues(
        registry,
        clientThemeModel!.light,
        clientThemeModel!.light.colorScheme,
      );
    }
  }

  @action
  void setDarkMode(bool value) {
    registry.setValue("switchTheme", value);
    isDarkMode = value;
    setSelectedSimportTheme(isDarkMode);
    setSelectedClientTheme(isDarkMode);
    SecureStorageService().saveThemeMode(isDarkMode);
  }
}

enum ThemeState { loading, success, empty, error }
