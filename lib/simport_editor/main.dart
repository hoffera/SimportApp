import "package:flutter_localizations/flutter_localizations.dart";
import "package:json_app/app/components/custom_widget_registrar.dart";
import "package:json_app/app/json%20dynamic%20widget/register/register_functions.dart";
import "package:json_app/l10n/app_localizations.dart";
import "package:json_app/simport_editor/config/go_router_config.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupRegistry();
  runApp(MyApp());
}

Future<void> _setupRegistry() async {
  registry.navigatorKey = GlobalKey<NavigatorState>();
  CustomWidgetRegistrar.registerDefaults(registry: registry);
  RegisterFunctions.registerAllFunctions(registry);
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

      routerConfig: SimportEditorGoRouter.router,
    );
  }
}
