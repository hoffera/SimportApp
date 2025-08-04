// ignore_for_file: public_member_api_docs, sort_constructors_first
import "dart:convert";

import "package:flutter_localizations/flutter_localizations.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart";
import "package:json_app/app/pages/home_json_screen_page/views/full_widget_page.dart";
import "package:json_app/app/pages/login_page/bindings/login_page_binding.dart";
import "package:json_app/app/routes/app_pages.dart";
import "package:json_app/app/theme/app_theme.dart";
import "package:json_app/app/theme/theme_controller.dart";
import "package:json_app/components/custom_widget_registrar.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_app/l10n/app_localizations.dart";
import "package:json_app/presentation/map_page/map_page.screen.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  registry.navigatorKey = GlobalKey<NavigatorState>();

  CustomWidgetRegistrar.registerDefaults(registry: registry);

  registry.registerFunction("navigatePage", ({args, required registry}) {
    return () async {
      final pageId = args?[0];
      if (pageId == null) {
        throw Exception("ID da página não fornecido.");
      }

      final url = Uri.parse(ApiConstants.getView(pageId));

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data["json"] as Map<String, dynamic>;

        registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(jsonData, registry: registry),
            ),
          ),
        );
      } else {
        throw Exception("Erro ao carregar: ${response.statusCode}");
      }
    };
  });

  registry.registerFunction("selectedIndex", ({args, required registry}) {
    return () async {
      final pageId = args?[0];
      if (pageId == null) {
        throw Exception("ID da página não fornecido.");
      }

      final url = Uri.parse(ApiConstants.getView(pageId));

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data["json"] as Map<String, dynamic>;

        registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(jsonData, registry: registry),
            ),
          ),
        );
      } else {
        throw Exception("Erro ao carregar: ${response.statusCode}");
      }
    };
  });

  registry.registerFunction(
    "navigate",
    ({args, required registry}) => () async {
      final String id = args![0];
      final url = Uri.parse("https://687fa87cefe65e52008a8cfe.mockapi.io/$id");

      final response = await http.get(Uri.parse("$url"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(
                data.first, // ou data[0]
                registry: registry,
              ),
            ),
          ),
        );
      } else {
        print("Erro ao buscar o bin: ${response.statusCode}");
      }
    },
  );

  registry.registerFunction(
    "showDrawer",
    ({args, required registry}) => () {
      final controller = Get.find<DynamicJsonPageController>();

      final bool id = args![0];
      controller.setRtl(id);
      controller.drawerController.showDrawer();
    },
  );
  registry.setValue("currentPageIndex", 0);
  registry.registerFunction("navBarIndex", ({args, required registry}) {
    if (args == null || args.length < 2) {
      return;
    }

    final String targetKey = args[0];
    final String sourceKey = args[1];

    final dynamic newIndex = registry.getValue(sourceKey);

    if (newIndex is int) {
      registry.setValue(targetKey, newIndex);
    }
  });

  final appTheme = AppTheme();
  await appTheme.loadThemes();
  await GetStorage.init();
  final controller = Get.put(ThemeController());

  String accessToken = const String.fromEnvironment("ACCESS_TOKEN");
  MapboxOptions.setAccessToken(accessToken);

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
      home: MapPageScreen(),
      initialBinding: LoginPageBinding(),
      // home: HomePageView(),
      // initialBinding: HomePageBinding(),
      getPages: AppPages.routes,
    );
  }
}
