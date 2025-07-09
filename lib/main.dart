import 'dart:convert';

import 'package:get/get.dart';
import 'package:json_app/app/pages/home_json_screen_page/views/full_widget_page.dart';
import 'package:json_app/app/pages/test_page/views/test_page_view.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/app/themes/theme_provider.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:provider/provider.dart';

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registry.navigatorKey = GlobalKey<NavigatorState>();

  // CustomWidgetRegistrar.registerDefaults(registry: registry);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
  // runApp(MyApp());
  registry.registerFunction('navigatePage', ({args, required registry}) {
    return () {
      rootBundle.loadString('lib/assets/json_pages/${args![0]}.json').then((
        jsonStr,
      ) {
        final jsonData = json.decode(jsonStr);
        registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(jsonData, registry: registry),
            ),
          ),
        );
      });
    };
  });

  // registry.registerFunction(
  //   'fetchWeather',
  //   ({args, required registry}) => () async {
  //     final controller = Get.find<WeatherPageController>();
  //     await controller.fetchWeather();
  //   },
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      navigatorKey: registry.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: TestPageView(),
      // home: CreateJsonPage(),
      getPages: AppPages.routes,
    );
  }
}
