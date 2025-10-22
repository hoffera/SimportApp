import "dart:convert";

import "package:firebase_core/firebase_core.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:get_it/get_it.dart";
import "package:json_app/firebase_options.dart";
import "package:json_app/l10n/app_localizations.dart";
import "package:json_app/src/data/services/auth_notifier.dart";
import "package:json_app/src/data/services/secure_storage_service.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/json%20dynamic%20widget/register/register_functions.dart";
import "package:json_app/src/json%20dynamic%20widget/register/register_widgets.dart";
import "package:json_app/src/utils/dependency_injection.dart";
import "package:json_app/src/utils/routes/go_router_config.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:simport_design_system/widgets/custom_widget_registrar.dart";

import "src/data/models/theme_model/theme_model.dart";

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // runApp(const SplashScreen());

  await dotenv.load(fileName: ".env");
  await setupDependencyInjection();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    setupTheme(),
    setupLanguage(),
    getIt<AuthNotifier>().refresh(),
  ]);
  CustomWidgetRegistrar.registerDefaults(registry: registry);
  RegisterFunctions.registerAllFunctions(registry);
  RegisterWidgets.registerDefaults(registry: registry);
  registry.navigatorKey = navigatorKey;

  // await NotificationService.localNotInit();
  // await NotificationService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("pt", "BR"), Locale("es")],
      debugShowCheckedModeBanner: false,
      routerConfig: SimportRouter().router(authNotifier: getIt<AuthNotifier>()),
    );
  }
}

Future<void> setupTheme() async {
  final themeLight = await rootBundle.loadString(
    "assets/theme/simport_theme_light.json",
  );

  final themeDark = await rootBundle.loadString(
    "assets/theme/simport_theme_dark.json",
  );
  ThemeModel simportThemeModel = ThemeModel(
    light: ThemeDecoder.decodeThemeData(jsonDecode(themeLight))!,
    dark: ThemeDecoder.decodeThemeData(jsonDecode(themeDark))!,
  );

  final themeJson = jsonDecode(themeDark);
  final themeDefault = ThemeDecoder.decodeThemeData(themeJson)!;

  final themeStore = getIt<ThemeStore>();
  themeStore.saveSimportThemeModel(simportThemeModel);
  themeStore.saveThemeDefault(themeDefault);

  final themeMode = await SecureStorageService().getThemeMode();
  themeStore.isDarkMode = themeMode;
}

Future<void> setupLanguage() async {
  final languageStore = getIt<LanguageStore>();
  final language = await SecureStorageService().getLanguage();
  if (language != null) {
    languageStore.setLocale(Locale(language));
  } else {
    languageStore.detectDeviceLanguage();
  }
}
