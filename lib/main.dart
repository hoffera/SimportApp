import "package:flutter_localizations/flutter_localizations.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:json_app/app/components/custom_widget_registrar.dart";
import "package:json_app/app/json dynamic widget/register/register_functions.dart";
import "package:json_app/app/pages/login_page/bindings/login_page_binding.dart";
import "package:json_app/app/pages/login_page/views/login_page_view.dart";
import "package:json_app/app/routes/app_pages.dart";
import "package:json_app/app/theme/app_theme.dart";
import "package:json_app/app/theme/theme_controller.dart";
import "package:json_app/l10n/app_localizations.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

void main() async {
  await _initializeApp();
  await _setupRegistry();
  await _setupServices();
  await _runApp();
}

Future<void> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Future<void> _setupRegistry() async {
  registry.navigatorKey = GlobalKey<NavigatorState>();
  CustomWidgetRegistrar.registerDefaults(registry: registry);
  RegisterFunctions.registerAllFunctions(registry);
}

Future<void> _setupServices() async {
  final appTheme = AppTheme();
  await appTheme.loadThemes();
  await GetStorage.init();
  final controller = Get.put(ThemeController());

  // Obtém o token de acesso do ambiente ou usa um valor padrão
  String accessToken = const String.fromEnvironment(
    "ACCESS_TOKEN",
    defaultValue: "",
  );

  // Verifica se o token foi fornecido
  if (accessToken.isEmpty) {
    print("[main] Aviso: ACCESS_TOKEN não foi fornecido via --dart-define");
  }

  MapboxOptions.setAccessToken(accessToken);
}

Future<void> _runApp() async {
  final controller = Get.find<ThemeController>();
  final appTheme = AppTheme();
  await appTheme.loadThemes();

  runApp(
    Obx(
      () => MyApp(
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: controller.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  const MyApp({
    super.key,
    required this.theme,
    required this.darkTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: Get.find<ThemeController>().isDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("pt", "BR"), Locale("es")],
      navigatorKey: registry.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: LoginPageView(),
      initialBinding: LoginPageBinding(),
      getPages: AppPages.routes,
    );
  }
}
