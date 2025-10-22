import "package:flutter_mobx/flutter_mobx.dart";
import "package:go_router/go_router.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/store/dynamic_screen_store.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

part "dropdown_language.g.dart";

@jsonWidget
abstract class _DropdownLanguageBuilder extends JsonWidgetBuilder {
  const _DropdownLanguageBuilder({required super.args});

  @override
  DropdownLanguage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class DropdownLanguage extends StatelessWidget {
  final String textPt;
  final String textEn;
  final String textEs;
  const DropdownLanguage({
    super.key,
    required this.textPt,
    required this.textEn,
    required this.textEs,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => DropdownButton<Locale>(
        value: getIt<LanguageStore>().currentLocale,
        items: [
          DropdownMenuItem(
            value: Locale("pt"),
            child: Text(textPt, style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          DropdownMenuItem(
            value: Locale("en"),
            child: Text(textEn, style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          DropdownMenuItem(
            value: Locale("es"),
            child: Text(textEs, style: TextStyle(fontWeight: FontWeight.w400)),
          ),
        ],
        onChanged: (Locale? newLocale) async {
          if (newLocale == null) {
            return;
          }
          getIt<LanguageStore>().setLocale(newLocale);
          context.pop();
          final DynamicScreenStore dynamicScreenStore =
              getIt<DynamicScreenStore>();
          await dynamicScreenStore.loadDynamicScreen(18);
        },
        underline: Container(),
      ),
    );
  }
}
