import "dart:ui";

import "package:json_app/l10n/app_localizations.dart";
import "package:json_app/src/data/services/secure_storage_service.dart";
import "package:mobx/mobx.dart";

part "language_store.g.dart";

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  Locale currentLocale = const Locale("pt", "BR");

  @observable
  AppLocalizations? currentLocalizations;

  @observable
  String languageCode = "pt";

  @action
  Future<void> setLocale(Locale newLocale) async {
    currentLocale = newLocale;
    languageCode = newLocale.languageCode;
    currentLocalizations = await AppLocalizations.delegate.load(newLocale);
    await SecureStorageService().saveLanguage(languageCode);
  }

  Future<void> init() async {
    final saved = await SecureStorageService().getLanguage();
    final locale = saved != null
        ? Locale(saved)
        : PlatformDispatcher.instance.locale;

    await setLocale(locale);
  }

  @action
  Future<void> detectDeviceLanguage([Locale? locale]) async {
    locale ??= PlatformDispatcher.instance.locale;

    switch (locale.languageCode) {
      case "en":
        await setLocale(const Locale("en"));
        break;
      case "es":
        await setLocale(const Locale("es"));
        break;
      default:
        await setLocale(const Locale("pt", "BR"));
        break;
    }
  }
}
