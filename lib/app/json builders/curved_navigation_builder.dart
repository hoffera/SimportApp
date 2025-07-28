// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'curved_navigation_builder.g.dart';

@jsonWidget
abstract class _CurvedNavBarBuilder extends JsonWidgetBuilder {
  const _CurvedNavBarBuilder({required super.args});

  @override
  CurvedNav buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });

  @JsonArgDecoder('icons')
  List<String> _decodeIcons({
    required dynamic value,
    required JsonWidgetRegistry registry,
  }) {
    if (value is! List) {
      print('icons não é lista: $value');
      return [];
    }

    return value.map<String>((icon) {
      if (icon is String) return icon;

      if (icon is! Map) {
        throw Exception(
          'icons deve ser uma lista de String ou Map, mas recebeu: $icon',
        );
      }

      throw Exception('Objeto ícone inválido no JSON: $icon');
    }).toList();
  }
}

class CurvedNav extends StatefulWidget {
  final List<String> icons;
  final String? registryKey;

  const CurvedNav({super.key, required this.icons, this.registryKey});

  @override
  State<CurvedNav> createState() => _CurvedNavState();
}

class _CurvedNavState extends State<CurvedNav> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    final registry = JsonWidgetRegistry.instance;
    final savedIndex = registry.getValue(widget.registryKey ?? '');
    if (savedIndex is int) {
      pageIndex = savedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry.instance;

    return RepaintBoundary(
      child: CurvedNavigationBar(
        index: pageIndex,
        height: 50,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        buttonBackgroundColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.primary,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        items: List.generate(
          widget.icons.length,
          (index) => Image.network(
            widget.icons[index],
            width: 30,
            height: 30,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        onTap: (index) async {
          // await Future.delayed(const Duration(milliseconds: 400));
          setState(() {
            pageIndex = index;
          });

          if (widget.registryKey != null) {
            registry.setValue(widget.registryKey!, index);
          }
        },
      ),
    );
  }
}
