import "package:json_app/src/data/services/auth_notifier.dart";
import "package:json_app/src/data/store/client_store.dart";
import "package:json_app/src/data/store/dynamic_screen_store.dart";
import "package:json_app/src/data/store/home_store.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/data/store/login_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/data/store/user_store.dart";

import "../../main.dart";

Future<void> setupDependencyInjection() async {
  getIt.registerSingleton<AuthNotifier>(AuthNotifier());
  getIt.registerSingleton<LoginStore>(LoginStore());
  getIt.registerSingleton<UserStore>(UserStore());
  getIt.registerSingleton<ClientStore>(ClientStore());
  getIt.registerSingleton<HomeStore>(HomeStore());
  getIt.registerSingleton<DynamicScreenStore>(DynamicScreenStore());
  getIt.registerSingleton<ThemeStore>(ThemeStore());
  getIt.registerSingleton<LanguageStore>(LanguageStore());
}
